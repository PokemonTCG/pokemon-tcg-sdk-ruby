require_relative 'rest_client'

module Pokemon
  class QueryBuilder
    include RestClient
    attr_accessor :type, :query
    
    def initialize(type)
      @type = type
      @query = {}
    end

    # Adds a parameter to the hash of query parameters
    #
    # @param args [Hash] the query parameter
    # @return [QueryBuilder] the QueryBuilder
    def where(args)
      @query.merge!(args)
      self.all
    end

    # Adds a q parameter (the query parameter) to the hash of query parameters
    #
    # @param query_value [String] the query value
    # @return [QueryBuilder] the QueryBuilder
    def query(query_value)
      hash = Hash.new
      hash[:q] = query_value
      @query.merge! hash
      self.all
    end
    
    # Find a single resource by the resource id
    #
    # @param id [String] the resource id
    # @return [Object] the Type object response
    def find(id)
      response = RestClient.get("#{@type.Resource}/#{id}")
      if response.body['data'].nil?
        raise ArgumentError, 'Resource not found'
      end
      
      @type.from_json response.body['data']
    end
    
    # Get all resources from a query by paging through data
    #
    # @return [Array<Object>] Array of resources
    def all
      list = []
      page = 1
      fetch_all = true

      if @query.has_key?(:page)
        page = @query[:page]
        fetch_all = false
      end
      
      while true
        response = RestClient.get(@type.Resource, @query)
        data = response.body['data']    
        if !data.nil? && data.any?
          data.each {|item| list << @type.from_json(item)}
          
          if !fetch_all
            break
          else
            where(page: page += 1)
          end
        else
          break
        end
      end

      return list
    end
  end
end