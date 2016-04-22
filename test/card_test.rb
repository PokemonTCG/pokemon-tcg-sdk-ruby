# encoding: UTF-8
require_relative 'test_helper'

class CardTest < Minitest::Test
  def test_find_returns_one_card
    VCR.use_cassette('one_card') do
      card = Pokemon::Card.find('xy7-57')

      assert_equal 'xy7-57', card.id
      assert_equal 'Giratina-EX', card.name
      assert_equal 'https://s3.amazonaws.com/pokemontcg/xy7/57.png', card.image_url
      assert_equal 'EX', card.subtype
      assert_equal 'Pokémon', card.supertype
      assert_equal 'Renegade Pulse', card.ability.name
      assert_equal "Prevent all effects of attacks, including damage, done to this Pokémon by your opponent's Mega Evolution Pokémon.", card.ability.text
      assert_equal "170", card.hp
      assert_equal ["Colorless","Colorless","Colorless"], card.retreat_cost
      assert_equal "57", card.number
      assert_equal "PLANETA", card.artist
      assert_equal "Rare Holo EX", card.rarity
      assert_equal "XY", card.series
      assert_equal "Ancient Origins", card.set
      assert_equal "xy7", card.set_code
      assert_equal ["When a Pokémon-EX has been Knocked Out, your opponent takes 2 Prize cards."], card.text
      assert_equal ["Dragon"], card.types
      assert card.attacks.any? {|attack| attack.cost == ["Grass","Psychic","Colorless","Colorless"] &&
                                         attack.name == "Chaos Wheel" &&
                                         attack.text == "Your opponent can't play any Pokémon Tool, Special Energy, or Stadium cards from his or her hand during his or her next turn." &&
                                         attack.damage == "100" &&
                                         attack.converted_energy_cost == 4 }
      assert card.weaknesses.any? {|weakness| weakness.type == "Fairy" &&
                                              weakness.value == "×2" }
    end
  end
  
  def test_find_with_invalid_id_throws_exception
    VCR.use_cassette('invalid_id') do
      assert_raises ArgumentError do
        Pokemon::Card.find('zzzz')
      end
    end
  end
  
  def test_where_with_page_size_and_page_returns_cards
    VCR.use_cassette('query_cards_pageSize') do
      cards = Pokemon::Card.where(pageSize: 10).where(page: 1).all

      # make sure we got only 10 cards back
      assert cards.length == 10
      assert cards.kind_of?(Array)
      assert cards.first.kind_of?(Pokemon::Card)
    end
  end

  def test_all_returns_cards
    VCR.use_cassette('all_filtered') do
      cards = Pokemon::Card.where(supertype: 'pokemon')
                       .where(subtype: 'basic')
                       .where(set: 'generations')
                       .all

      card = cards[0]
      assert_equal 'Pokémon', card.supertype
      assert_equal 'Basic', card.subtype
      assert_equal 'Generations', card.set
    end
  end
  
  def test_all_returns_all_cards
    VCR.use_cassette('all_cards') do
      stub_request(:any, "https://api.pokemontcg.io/v1/cards").
        to_return(:body => File.new('test/responses/sample_cards.json'), :status => 200, :headers => {"Content-Type"=> "application/json"})
      
      stub_request(:any, "https://api.pokemontcg.io/v1/cards?page=2").
        to_return(:body => File.new('test/responses/no_cards.json'), :status => 200, :headers => {"Content-Type"=> "application/json"})
        
      cards = Pokemon::Card.all
      
      assert_equal 2, cards.length
    end
  end
end