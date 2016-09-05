require_relative 'representers/ancient_trait_representer'

module Pokemon
  class AncientTrait
    include Roar::JSON
    include AncientTraitRepresenter
  
    attr_accessor :name, :text
  end
end
