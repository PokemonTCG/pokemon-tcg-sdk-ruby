require 'test_helper'

class SubtypeTest < Minitest::Test
  def test_all_returns_all_subtypes
    VCR.use_cassette('all_subtypes') do
      types = Pokemon::Subtype.all
      
      assert types.length > 10
      assert types.any? {|type| type == 'Basic'}
    end
  end
end