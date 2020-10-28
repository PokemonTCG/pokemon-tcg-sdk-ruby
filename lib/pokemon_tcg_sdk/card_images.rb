module Pokemon
  class CardImages
    attr_accessor :small, :large

    def self.from_json(json)
      images = CardImages.new
      images.small = json['small']
      images.large = json['large']

      images
    end
  end
end
