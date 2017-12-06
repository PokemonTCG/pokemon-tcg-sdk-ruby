require "pokemon_tcg_sdk/version"
require "pokemon_tcg_sdk/card"
require "pokemon_tcg_sdk/configuration"
require "pokemon_tcg_sdk/query_builder"
require "pokemon_tcg_sdk/rest_client"
require "pokemon_tcg_sdk/type"
require "pokemon_tcg_sdk/subtype"
require "pokemon_tcg_sdk/supertype"
require "pokemon_tcg_sdk/set"

module Pokemon
  API_URL = 'https://api.pokemontcg.io'

  class << self
    attr_writer :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.configure
    yield(configuration)
  end

  def self.reset
    @configuration = Configuration.new
  end
end