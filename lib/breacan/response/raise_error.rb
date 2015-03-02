require 'faraday'
require 'breacan/error'

module Breacan
  module Response
    class RaiseError < Faraday::Response::Middleware
      private

      def on_complete(response)
        if error = Breacan::Error.from_response(response)
          raise error
        end
      end
    end
  end
end
