module Breacan
  class Client
    module Rtm
      def rtm_start
        post 'rtm.start'
      end
    end
  end
end
