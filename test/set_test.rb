require_relative 'test_helper'

class SetTest < Minitest::Test
  def test_find_returns_one_set
    VCR.use_cassette('one_set') do
      set = Pokemon::Set.find('g1')
      
      assert_equal 'g1', set.id
      assert_equal 'Generations', set.name
      assert_equal 'XY', set.series
      assert_equal "2016/02/22", set.release_date
      assert_equal "https://images.pokemontcg.io/g1/symbol.png", set.images.symbol
      assert_equal "https://images.pokemontcg.io/g1/logo.png", set.images.logo
      assert_equal 'GEN', set.ptcgo_code
    end
  end
  
  def test_find_with_invalid_code_throws_exception
    VCR.use_cassette('invalid_code') do
      assert_raises ArgumentError do
        Pokemon::Set.find('invalid')
      end
    end
  end
  
  def test_all_returns_all_sets
    VCR.use_cassette('all_sets') do
      sets = Pokemon::Set.all
      
      assert sets.length > 10
    end
  end
  
  def test_where_filters_on_cards
    VCR.use_cassette('filtered_sets') do
      sets = Pokemon::Set.where(q: 'legalities.standard:legal')
      
      assert_equal 'Legal', sets[0].legalities.standard
    end
  end

  def test_cards_returns_all_cards_in_set
    VCR.use_cassette('base_set_cards') do
      base_set = Pokemon::Set.where(q: '!name:Base !series:Base').first
      base_cards_ref = Pokemon::Card.where(q: '!set.name:"Base" !set.series:"Base"')
      base_cards = base_set.cards

      assert_equal base_cards.size, 102
      assert_equal base_cards.size, base_cards_ref.size

      ids = base_cards.map(&:id)
      assert_equal ids.include?('base1-1'), true

      base_cards_ref.each do |card|
        assert_equal ids.include?(card.id), true
      end
    end
  end
end