module Pokemon
  class Supertype
    include RestClient
    
    # Get all supertypes
    #
    # @return [Array<String>]  All supertypes
    def self.all
      RestClient.get('supertypes')['data']
    end
  end
end