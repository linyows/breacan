require 'faraday'
require 'breacan/error'

module Breacan
  module Response
    # NOTE: Since faraday v.2, `Faraday::Response::Middleware` has been removed. We can use `Faraday::Middleware` instead.
    # ref: https://github.com/lostisland/faraday/blob/c9cc1b30ecebcd57beffa67d275f68742b5b05c5/UPGRADING.md?plain=1#L128
    middleware_base = defined?(Faraday::Response::Middleware) ? Faraday::Response::Middleware : Faraday::Middleware

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

        if error = Breacan::Error.from_body(res, body)
          raise error
        end
      end
    end

    Faraday::Response.register_middleware \
      breacan_custom: -> { Breacan::Response::Custom }
  end
end
