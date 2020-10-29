module Pokemon
  class Card
    attr_accessor :id, :name, :supertype, :subtypes, :level, :hp, :types, :evolves_from, :evolves_to, :rules, :ancient_trait,
      :abilities, :attacks, :weaknesses, :resistances, :retreat_cost, :converted_retreat_cost, :set, :number, :artist, :rarity, :national_pokedex_numbers,
      :legalities, :tcgplayer, :images

    def self.from_json(json)
      card = Card.new
      card.id = json['id']
      card.name = json['name']
      card.supertype = json['supertype']
      card.subtypes = json['subtypes']
      card.level = json['level']
      card.hp = json['hp']
      card.types = json['types']
      card.evolves_from = json['evolvesFrom']
      card.evolves_to = json['evolvesTo']
      card.rules = json['rules']
      card.ancient_trait = AncientTrait.from_json(json['ancientTrait']) if !json['ancientTrait'].nil?
      card.abilities = json['abilities'].map {|ability_json| Ability.from_json(ability_json)} if !json['abilities'].nil?
      card.attacks = json['attacks'].map {|attack_json| Attack.from_json(attack_json)} if !json['attacks'].nil?
      card.weaknesses = json['weaknesses'].map {|weakness_json| Weakness.from_json(weakness_json)} if !json['weaknesses'].nil?
      card.resistances = json['resistances'].map {|resistance_json| Resistance.from_json(resistance_json)} if !json['resistances'].nil?
      card.retreat_cost = json['retreatCost']
      card.converted_retreat_cost = json['convertedRetreatCost']
      card.set = Set.from_json(json['set'])
      card.number = json['number']
      card.artist = json['artist']
      card.rarity = json['rarity']
      card.national_pokedex_numbers = json['nationalPokedexNumbers']
      card.legalities = Legalities.from_json(json['legalities']) if !json['legalities'].nil?
      card.tcgplayer = Tcgplayer.from_json(json['tcgplayer']) if !json['tcgplayer'].nil?
      card.images = CardImages.from_json(json['images']) if !json['images'].nil?
      card
    end

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
    # @return [Array<Card>] Array of Card objects
    def self.where(args)
      QueryBuilder.new(Card).where(args)
    end

    # Adds a q parameter (query parameter) to the hash of query parameters
    #
    # @param query_value [String] the query value
    # @return [Array<Card>] Array of Card objects
    def self.query(query_value)
      QueryBuilder.new(Card).query(query_value)
    end
  end
end