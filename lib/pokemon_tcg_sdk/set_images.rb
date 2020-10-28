module Pokemon
  class SetImages
    attr_accessor :symbol, :logo

    def self.from_json(json)
      images = SetImages.new
      images.symbol = json['symbol']
      images.logo = json['logo']

      images
    end
  end
end
