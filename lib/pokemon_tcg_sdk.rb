require "pokemon_tcg_sdk/version"
require "pokemon_tcg_sdk/card"
require "pokemon_tcg_sdk/configuration"
require "pokemon_tcg_sdk/query_builder"
require "pokemon_tcg_sdk/rest_client"
require "pokemon_tcg_sdk/ability"
require "pokemon_tcg_sdk/attack"
require "pokemon_tcg_sdk/type"
require "pokemon_tcg_sdk/subtype"
require "pokemon_tcg_sdk/supertype"
require "pokemon_tcg_sdk/set"
require "pokemon_tcg_sdk/weakness"
require "pokemon_tcg_sdk/resistance"
require "pokemon_tcg_sdk/legalities"
require "pokemon_tcg_sdk/card_images"
require "pokemon_tcg_sdk/set_images"
require "pokemon_tcg_sdk/tcgplayer"
require "pokemon_tcg_sdk/ancient_trait"
require "pokemon_tcg_sdk/rarity"

module Pokemon
  API_URL = 'https://beta.pokemontcg.io'

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