require_relative 'hashie_snake'

module Pokemon
  class Set < HashieSnake
    # Get the resource string
    #
    # @return [String] The API resource string
    def self.Resource
      "sets"
    end
    
    # Find a single set by the set code
    #
    # @param id [String] the set code
    # @return [Set] the Set object response
    def self.find(id)
      QueryBuilder.new(Set).find(id)
    end

    # Get all sets from a query by paging through data
    #
    # @return [Array<Set>] Array of Set objects
    def self.all
      QueryBuilder.new(Set).all
    end
    
    # Adds a parameter to the hash of query parameters
    #
    # @param args [Hash] the query parameter
    # @return [QueryBuilder] the QueryBuilder
    def self.where(args)
      QueryBuilder.new(Set).where(args)
    end
  end
end