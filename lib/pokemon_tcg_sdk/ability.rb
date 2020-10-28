module Pokemon
  class Ability
    attr_accessor :name, :text, :type

    def self.from_json(json)
      ability = Ability.new
      ability.name = json['name']
      ability.text = json['text']
      ability.type = json['type']

      ability
    end
  end
end
