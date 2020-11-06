module Pokemon
  class Subtype
    include RestClient
    
    # Get all subtypes
    #
    # @return [Array<String>]  All subtypes
    def self.all
      RestClient.get('subtypes')['data']
    end
  end
end