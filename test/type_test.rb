require 'test_helper'

class TypeTest < Minitest::Test
  def test_all_returns_all_types
    VCR.use_cassette('all_types') do
      types = Pokemon::Type.all
      
      assert types.length > 5
      assert types.any? {|type| type == 'Water'}
    end
  end
end