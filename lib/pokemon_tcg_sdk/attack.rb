module Pokemon
  class Attack
    attr_accessor :cost, :name, :text, :damage, :converted_energy_cost

    def self.from_json(json)
      attack = Attack.new
      attack.cost = json['cost']
      attack.name = json['name']
      attack.text = json['text']
      attack.damage = json['damage']
      attack.converted_energy_cost = json['convertedEnergyCost']

      attack
    end
  end
end
