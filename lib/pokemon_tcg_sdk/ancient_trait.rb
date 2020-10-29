module Pokemon
  class AncientTrait
    attr_accessor :name, :text

    def self.from_json(json)
      trait = AncientTrait.new
      trait.name = json['name']
      trait.text = json['text']

      trait
    end
  end
end
