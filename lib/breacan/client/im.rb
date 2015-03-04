module Breacan
  class Client
    module Im
      def im_close(args)
        get 'im.close', query: args
      end

      def im_history(args)
        get 'im.history', query: args
      end

      def im_list(args)
        get 'im.list', query: args
      end

      def im_mark(args)
        get 'im.mark', query: args
      end

      def im_open(args)
        get 'im.open', query: args
      end
    end
  end
end
