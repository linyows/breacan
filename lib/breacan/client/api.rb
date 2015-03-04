module Breacan
  class Client
    module Api
      def api_test(args)
        get 'api.test', query: args
      end
    end
  end
end
