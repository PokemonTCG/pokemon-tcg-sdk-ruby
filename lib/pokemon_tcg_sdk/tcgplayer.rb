module Pokemon
  class Tcgplayer
    attr_accessor :url, :prices

    def self.from_json(json)
      tcgplayer = Tcgplayer.new
      tcgplayer.url = json['url']
      tcgplayer.prices = TcgPlayerPrices.from_json(json['prices'])

      tcgplayer
    end
  end

  class TcgPlayerPrices
    attr_accessor :normal, :holofoil, :reverse_holofoil, :first_edition_holofoil, :first_edition_normal
    
    def self.from_json(json)
      price = TcgPlayerPrices.new
      price.normal = TcgPlayerPriceValues.from_json(json['normal']) if !json['normal'].nil?
      price.holofoil = TcgPlayerPriceValues.from_json(json['holofoil']) if !json['holofoil'].nil?
      price.reverse_holofoil = TcgPlayerPriceValues.from_json(json['reverseHolofoil']) if !json['reverseHolofoil'].nil?
      price.first_edition_holofoil = TcgPlayerPriceValues.from_json(json['1stEditionHolofoil']) if !json['1stEditionHolofoil'].nil?
      price.first_edition_normal = TcgPlayerPriceValues.from_json(json['1stEditionNormal']) if !json['1stEditionNormal'].nil?

      price
    end
  end

  class TcgPlayerPriceValues
    attr_accessor :low, :mid, :high, :market, :direct

    def self.from_json(json)
      values = TcgPlayerPriceValues.new
      values.low = json['low']
      values.mid = json['mid']
      values.high = json['high']
      values.market = json['market']
      values.direct = json['direct']

      values
    end
  end
end
