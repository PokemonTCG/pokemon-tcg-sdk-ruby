require 'roar/json'

module Pokemon
  module AttackRepresenter
    include Roar::JSON

    collection :cost
    property :name
    property :text
    property :damage
    property :converted_energy_cost, as: :convertedEnergyCost
  end
end