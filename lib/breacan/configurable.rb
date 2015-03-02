require 'breacan/response/raise_error'

module Breacan
  module Configurable
    OPTIONS_KEYS = %i(
      access_token
      team
      api_endpoint
      web_endpoint
      user_agent
      media_type
      connection_options
      proxy
      middleware
    )

    attr_accessor(*OPTIONS_KEYS)

    class << self
      def keys
        @keys ||= OPTIONS_KEYS
      end
    end

    def configure
      yield self
    end

    def api_endpoint
      File.join(@api_endpoint, '')
    end

    def web_endpoint
      File.join(@web_endpoint, '')
    end

    def reset!
      @access_token       = ENV['BREACAN_ACCESS_TOKEN']
      @team               = ENV['BREACAN_TEAM']
      @api_endpoint       = ENV['BREACAN_API_ENDPOINT'] || 'https://slack.com/api/'
      @web_endpoint       = ENV['BREACAN_WEB_ENDPOINT'] || "https://#{@team}.slack.com/"
      @user_agent         = "Breacan Ruby Gem #{Breacan::VERSION}"
      @media_type         = 'application/json'
      @connection_options = { headers: { accept: media_type, user_agent: user_agent } }
      @proxy              = ENV['BREACAN_PROXY']
      @middleware         = Faraday::RackBuilder.new { |builder|
          builder.use Breacan::Response::RaiseError
          builder.adapter Faraday.default_adapter
        }
      self
    end
    alias setup reset!

    def options
      Hash[Breacan::Configurable.keys.map { |key|
        [key, instance_variable_get(:"@#{key}")]
      }]
    end
  end
end
