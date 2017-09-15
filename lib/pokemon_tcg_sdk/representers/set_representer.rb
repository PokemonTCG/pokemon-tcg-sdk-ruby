require 'roar/json'

module Pokemon
  module SetRepresenter
    include Roar::JSON

    property :code
    property :name
    property :series
    property :ptcgo_code, as: :ptcgoCode
    property :symbol_url, as: :symbolUrl
    property :total_cards, as: :totalCards
    property :standard_legal, as: :standardLegal
    property :expanded_legal, as: :expandedLegal
    property :release_date, as: :releaseDate
  end
end