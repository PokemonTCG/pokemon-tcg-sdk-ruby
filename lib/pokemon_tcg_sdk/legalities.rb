module Pokemon
  class Legalities
    attr_accessor :expanded, :standard, :unlimited

    def self.from_json(json)
      legality = Legalities.new
      legality.expanded = json['expanded']
      legality.standard = json['standard']
      legality.unlimited = json['unlimited']

      legality
    end
  end
end
