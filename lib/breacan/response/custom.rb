require 'faraday'
require 'breacan/error'

module Breacan
  module Response
    class Custom < Faraday::Response::Middleware
      private

      def on_complete(res)
        if error = Breacan::Error.from_response(res)
          raise error
        end

        return if res[:body].empty?

        body = Sawyer::Agent.serializer.decode(res[:body])
        if body[:ok]
          res[:body].gsub!('"ok":true,', '')
        end
      end
    end

    Faraday::Response.register_middleware \
      breacan_custom: -> { Breacan::Response::Custom }
  end
end
