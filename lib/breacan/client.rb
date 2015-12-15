require 'sawyer'
require 'breacan/configurable'
require 'breacan/authentication'
require 'breacan/client/api'
require 'breacan/client/auth'
require 'breacan/client/channels'
require 'breacan/client/chat'
require 'breacan/client/emoji'
require 'breacan/client/files'
require 'breacan/client/groups'
require 'breacan/client/im'
require 'breacan/client/oauth'
require 'breacan/client/rtm'
require 'breacan/client/search'
require 'breacan/client/star'
require 'breacan/client/users'
require 'breacan/client/usergroups'

module Breacan
  class Client
    include Breacan::Authentication
    include Breacan::Configurable
    include Breacan::Client::Api
    include Breacan::Client::Auth
    include Breacan::Client::Channels
    include Breacan::Client::Chat
    include Breacan::Client::Emoji
    include Breacan::Client::Files
    include Breacan::Client::Groups
    include Breacan::Client::Im
    include Breacan::Client::OAuth
    include Breacan::Client::Rtm
    include Breacan::Client::Search
    include Breacan::Client::Star
    include Breacan::Client::Users
    include Breacan::Client::Usergroups

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
        options[:query][:token] = access_token
      end

      @last_response = response = agent.call(
        method,
        URI::Parser.new.escape(path.to_s),
        data,
        options
      )

      simplize_body response.data
    end

    def simplize_body(body)
      body.to_hash.keys.count == 1 ? body[body.to_hash.keys.last] : body
    end

    def last_response
      @last_response if defined? @last_response
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
