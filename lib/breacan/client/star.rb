module Breacan
  class Client
    module Star
      def star_list(args)
        get 'star.list', query: args
      end
    end
  end
end
