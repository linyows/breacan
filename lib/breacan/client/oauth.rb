module Breacan
  class Client
    module OAuth
      def oauth_access(args)
        post 'oauth.access', query: args
      end
    end
  end
end
