require_relative 'representers/attack_representer'

module Pokemon
  class Attack
    include Roar::JSON
    include AttackRepresenter
  
    attr_accessor :cost, :name, :text, :damage, :converted_energy_cost
  end
end
