require_relative 'test_helper'

class SetTest < Minitest::Test
  def test_find_returns_one_set
    VCR.use_cassette('one_set') do
      set = Pokemon::Set.find('g1')
      
      assert_equal 'g1', set.code
      assert_equal 'Generations', set.name
      assert_equal 'XY', set.series
      assert_equal 115, set.total_cards
      assert_equal "02/22/2016", set.release_date
      assert_equal "https://images.pokemontcg.io/g1/symbol.png", set.symbol_url
      assert_equal "https://images.pokemontcg.io/g1/logo.png", set.logo_url
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
      sets = Pokemon::Set.where(standardLegal: true)
      
      assert_equal true, sets[0].standard_legal
    end
  end
end