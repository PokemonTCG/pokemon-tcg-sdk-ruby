module Pokemon
  class Resistance
    attr_accessor :type, :value

    def self.from_json(json)
      resistance = Resistance.new
      resistance.type = json['type']
      resistance.value = json['value']

      resistance
    end
  end
end
  