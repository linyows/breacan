module Breacan
  class Client
    module Rtm
      def rtm_start
        get 'rtm.start'
      end
    end
  end
end
