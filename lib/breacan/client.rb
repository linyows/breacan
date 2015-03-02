require 'sawyer'
require 'breacan/configurable'
require 'breacan/authentication'
require 'breacan/client/oauth'
require 'breacan/client/channels'
require 'breacan/client/chat'

module Breacan
  class Client
    include Breacan::Authentication
    include Breacan::Configurable
    include Breacan::Client::OAuth
    include Breacan::Client::Channels
    include Breacan::Client::Chat

    CONVENIENCE_HEADERS = Set.new(%i(accept content_type))

    def initialize(options = {})
      Breacan::Configurable.keys.each do |key|
        instance_variable_set(:"@#{key}", options[key] || Breacan.instance_variable_get(:"@#{key}"))
      end
    end

    def same_options?(opts)
      opts.hash == options.hash
    end

    def get(url, options = {})
      request :get, url, parse_query_and_convenience_headers(options)
    end

    def post(url, options = {})
      request :post, url, options
    end

    def put(url, options = {})
      request :put, url, options
    end

    def patch(url, options = {})
      request :patch, url, options
    end

    def delete(url, options = {})
      request :delete, url, options
    end

    def head(url, options = {})
      request :head, url, parse_query_and_convenience_headers(options)
    end

    def agent
      @agent ||= Sawyer::Agent.new(api_endpoint, sawyer_options) do |http|
        http.headers[:accept] = media_type
        http.headers[:content_type] = media_type
        http.headers[:user_agent] = user_agent
      end
    end

    private

    def request(method, path, data, options = {})
      if data.is_a?(Hash)
        options[:query] = data.delete(:query) || {}
        options[:headers] = data.delete(:headers) || {}
        if accept = data.delete(:accept)
          options[:headers][:accept] = accept
        end
      end
      api_path = URI::Parser.new.escape("#{path.to_s}?token=#{@access_token}")
      @last_response = response = agent.call(method, api_path, data, options)
      response.data
    end

    def boolean_from_response(method, path, options = {})
      request(method, path, options)
      @last_response.status == 204
    rescue Breacan::NotFound
      false
    end

    def sawyer_options
      opts = {
        :links_parser => Sawyer::LinkParsers::Simple.new
      }
      conn_opts = @connection_options
      conn_opts[:builder] = @middleware if @middleware
      conn_opts[:proxy] = @proxy if @proxy
      opts[:faraday] = Faraday.new(conn_opts)

      opts
    end

    def parse_query_and_convenience_headers(options)
      headers = options.fetch(:headers, {})
      CONVENIENCE_HEADERS.each do |h|
        if header = options.delete(h)
          headers[h] = header
        end
      end
      query = options.delete(:query)
      opts = {:query => options}
      opts[:query].merge!(query) if query && query.is_a?(Hash)
      opts[:headers] = headers unless headers.empty?

      opts
    end
  end
end
