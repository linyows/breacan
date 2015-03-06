require 'faraday'
require 'breacan/error'
require 'json'

module Breacan
  module Response
    class Custom < Faraday::Response::Middleware
      private

      def on_complete(res)
        if error = Breacan::Error.from_body(res)
          raise error
        end

        return if res[:body].empty?

        body = JSON.load(res[:body])
        if body['ok']
          res[:body].gsub!('"ok":true,', '')
        end
      end
    end

    Faraday::Response.register_middleware \
      breacan_custom: -> { Breacan::Response::Custom }
  end
end
