require_relative 'representers/type_value_representer'

module Pokemon
  class TypeValue
    include Roar::JSON
    include TypeValueRepresenter
  
    attr_accessor :type, :value
  end
end
