require_relative 'hashie_snake'

module Pokemon
  class Card < HashieSnake

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