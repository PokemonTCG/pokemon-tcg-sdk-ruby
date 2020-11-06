require 'faraday'
require 'faraday_middleware'
require 'erb'

module Pokemon
  module RestClient

    def self.get(endpoint, params=nil)
      if params.nil?
        query = endpoint
      else
        query = "#{endpoint}?#{params_to_query(params)}"
      end

      response = client.get(query)

      case response.status
      when 200
        JSON.parse(response.body)
      when 429
        raise 'You have hit your rate limit.'
      when 404
        raise ArgumentError, 'Resource not found'
      when 403
        raise 'You are not authorized to access this endpoint. Please make sure you have a valid API Key. Go to https://dev.pokemontcg.io for more info.'
      else
        raise 'Something went wrong...please try again later.'
      end
    end
    
    protected
    
    def self.client
      @client = Faraday.new(
        url: "#{API_URL}/v2",
        headers: {'Content-Type' => 'application/json', 'X-Api-Key' => Pokemon.configuration.api_key}
      )
    end

    def self.params_to_query(params)
      params.map {|p, v| "#{p}=#{ERB::Util.url_encode(v.to_s)}"}.join('&')
    end
  end
end