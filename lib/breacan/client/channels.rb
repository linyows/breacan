module Breacan
  class Client
    module Channels
      def channels_list
        get 'channels.list'
      end

      def channels_info(args)
        get 'channels.info', query: args
      end

      def channels_history(args)
        get 'channels.history', query: args
      end

      def channels_info_by_name(name)
        res = channels_list
        res.channels.find { |ch| ch['name'] == name } if res.ok
      end
    end
  end
end
