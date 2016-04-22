require 'roar/json'

module Pokemon
  module TypeValueRepresenter
    include Roar::JSON

    property :type
    property :value
  end
end