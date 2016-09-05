require_relative 'representers/card_representer'

module Pokemon
  class Card
    include Roar::JSON
    include CardRepresenter
    
    attr_accessor :id, :name, :image_url, :subtype, :supertype, :ability,
                  :hp, :number, :artist, :rarity, :series, :set, :set_code,
                  :retreat_cost, :text, :types, :attacks, :weaknesses, :resistances,
                  :national_pokedex_number, :ancient_trait
                  
    # Get the resource string
    #
    # @return [String] The API resource string
    def self.Resource
      "cards"
    end
    
    # Find a single card by the card id
    #
    # @param id [String] the card id
    # @return [Card] the Card object response
    def self.find(id)
      QueryBuilder.new(Card).find(id)
    end

    # Get all cards from a query by paging through data
    #
    # @return [Array<Card>] Array of Card objects
    def self.all
      QueryBuilder.new(Card).all
    end
    
    # Adds a parameter to the hash of query parameters
    #
    # @param args [Hash] the query parameter
    # @return [QueryBuilder] the QueryBuilder
    def self.where(args)
      QueryBuilder.new(Card).where(args)
    end
  end
end