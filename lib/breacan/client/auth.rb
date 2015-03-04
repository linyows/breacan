module Breacan
  class Client
    module Auth
      def auth_test(args)
        get 'auth.test', query: args
      end
    end
  end
end
