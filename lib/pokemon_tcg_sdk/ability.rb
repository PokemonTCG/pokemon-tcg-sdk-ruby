require_relative 'representers/ability_representer'

module Pokemon
  class Ability
    include Roar::JSON
    include AbilityRepresenter
  
    attr_accessor :name, :text, :type
  end
end
