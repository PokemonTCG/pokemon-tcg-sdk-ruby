require_relative 'representers/set_representer'

module Pokemon
  class Set
    include Roar::JSON
    include SetRepresenter

    attr_accessor :code, :name, :series, :total_cards, :standard_legal, :expanded_legal, :release_date,
                  :symbol_url, :logo_url, :ptcgo_code, :updated_at

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