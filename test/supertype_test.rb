require_relative 'test_helper'

class SupertypeTest < Minitest::Test
  def test_all_returns_all_types
    VCR.use_cassette('all_supertypes') do
      types = Pokemon::Supertype.all
      
      assert_equal ["Pokémon","Energy","Trainer"], types
    end
  end
end