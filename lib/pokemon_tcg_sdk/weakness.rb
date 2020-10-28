module Pokemon
  class Weakness
    attr_accessor :type, :value

    def self.from_json(json)
      weakness = Weakness.new
      weakness.type = json['type']
      weakness.value = json['value']

      weakness
    end
  end
end
