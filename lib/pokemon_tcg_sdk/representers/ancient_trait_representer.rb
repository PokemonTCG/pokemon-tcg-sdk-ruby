require 'roar/json'

module Pokemon
  module AncientTraitRepresenter
    include Roar::JSON
    
    property :name
    property :text
  end
end