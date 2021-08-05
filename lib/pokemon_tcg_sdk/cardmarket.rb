module Pokemon
  class Cardmarket
    attr_accessor :url, :prices, :updated_at

    def self.from_json(json)
      cardmarket = Cardmarket.new
      cardmarket.url = json['url']
      cardmarket.updated_at = json['updatedAt']
      cardmarket.prices = CardmarketPrices.from_json(json['prices']) if !json['prices'].nil?

      cardmarket
    end
  end

  class CardmarketPrices
    attr_accessor :average_sell_price, :low_price, :trend_price, :german_pro_low, :suggested_price,
      :reverse_holo_sell, :reverse_holo_low, :reverse_holo_trend, :low_price_ex_plus, :avg1, :avg7, :avg30,
      :reverse_holo_avg1, :reverse_holo_avg7, :reverse_holo_avg30
    
    def self.from_json(json)
      price = CardmarketPrices.new
      price.average_sell_price = json['averageSellPrice']
      price.low_price = json['lowPrice']
      price.trend_price = json['trendPrice']
      price.german_pro_low = json['germanProLow']
      price.suggested_price = json['suggestedPrice']
      price.reverse_holo_sell = json['reverseHoloSell']
      price.reverse_holo_low = json['reverseHoloLow']
      price.reverse_holo_trend = json['reverseHoloTrend']
      price.low_price_ex_plus = json['lowPriceExPlus']
      price.avg1 = json['avg1']
      price.avg7 = json['avg7']
      price.avg30 = json['avg30']
      price.reverse_holo_avg1 = json['reverseHoloAvg1']
      price.reverse_holo_avg7 = json['reverseHoloAvg7']
      price.reverse_holo_avg30 = json['reverseHoloAvg30']

      price
    end
  end
end
