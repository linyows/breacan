module Breacan
  class Client
    module OAuth
      def oauth_access(args)
        get 'oauth.access', query: args
      end
    end
  end
end
