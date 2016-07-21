require 'roar/json'
require_relative 'attack_representer'
require_relative 'type_value_representer'
require_relative 'ability_representer'
require_relative '../attack'
require_relative '../type_value'
require_relative '../ability'

module Pokemon
  module CardRepresenter
    include Roar::JSON

    property :id
    property :name
    property :image_url, as: :imageUrl
    property :subtype
    property :supertype
    property :ability, extend: AbilityRepresenter, class: Ability
    property :hp
    property :number
    property :artist
    property :rarity
    property :series
    property :set
    property :set_code, as: :setCode
    property :national_pokedex_number, as: :nationalPokedexNumber
    
    collection :retreat_cost, as: :retreatCost
    collection :text
    collection :types
    collection :attacks, extend: AttackRepresenter, class: Attack
    collection :weaknesses, extend: TypeValueRepresenter, class: TypeValue
    collection :resistances, extend: TypeValueRepresenter, class: TypeValue
  end
end