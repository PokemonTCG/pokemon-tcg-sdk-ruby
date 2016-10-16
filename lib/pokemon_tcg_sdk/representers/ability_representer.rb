require 'roar/json'

module Pokemon
  module AbilityRepresenter
    include Roar::JSON
    
    property :name
    property :text
    property :type
  end
end