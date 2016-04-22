#test/client_test.rb
require_relative 'test_helper'

class ConfigurationTest < Minitest::Test
  def test_defaults
    config = Pokemon::Configuration.new

    assert_equal 1, config.api_version
  end
  
  def test_reset
    Pokemon.configure do |config|
      config.api_version = 2
    end
    
    Pokemon.reset
    
    assert_equal 1, Pokemon.configuration.api_version
  end
end