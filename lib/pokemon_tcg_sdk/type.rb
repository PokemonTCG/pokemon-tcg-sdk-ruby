module Pokemon
  class Type
    include RestClient
    
    # Get all types
    #
    # @return [Array<String>]  All types
    def self.all
      RestClient.get('types')['data']
    end
  end
end