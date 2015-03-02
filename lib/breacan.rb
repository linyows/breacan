require 'breacan/version'
require 'breacan/client'

module Breacan
  class << self
    include Breacan::Configurable

    def client
      unless defined?(@client) && @client.same_options?(options)
        @client = Breacan::Client.new(options)
      end
      @client
    end

    private

    def method_missing(method_name, *args, &block)
      return super unless client.respond_to?(method_name)
      client.send(method_name, *args, &block)
    end
  end
end

Breacan.setup
