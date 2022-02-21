module Pokemon
  class Set
    attr_accessor :id, :name, :series, :printed_total, :total, :legalities, :ptcgo_code, :release_date, :updated_at, :images

    def self.from_json(json)
      set = Set.new
      set.id = json['id']
      set.name = json['name']
      set.series = json['series']
      set.printed_total = json['printedTotal']
      set.total = json['total']
      set.legalities = Legalities.from_json(json['legalities']) if !json['legalities'].nil?
      set.ptcgo_code = json['ptcgoCode']
      set.release_date = json['releaseDate']
      set.updated_at = json['updatedAt']
      set.images = SetImages.from_json(json['images']) if !json['images'].nil?

      set
    end

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
    # @return [Array<Set>] Array of Set objects
    def self.where(args)
      QueryBuilder.new(Set).where(args)
    end

    # Accessor for querying all the cards in this set
    #
    # @return [Array<Card>] Array of Card objects
    def cards
      QueryBuilder.new(Card).where(q: '!set.name:"' + self.name + '" !set.series:"' + self.series + '"')
    end
  end
end