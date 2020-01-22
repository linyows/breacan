module Breacan
  class Client
    module Channels
      def channels_archive(args)
        get 'channels.archive', query: args
      end

      def channels_create(args)
        get 'channels.create', query: args
      end

      def channels_history(args)
        get 'channels.history', query: args
      end

      def channels_info(id, options)
        get 'channels.info', query: { channel: id }.merge(options)
      end
      alias_method :channel, :channels_info

      def channels_invite(args)
        get 'channels.invite', query: args
      end

      def channels_join(args)
        get 'channels.join', query: args
      end

      def channels_kick(args)
        get 'channels.kick', query: args
      end

      def channels_leave(args)
        get 'channels.leave', query: args
      end

      def channels_list(args = nil)
        get 'channels.list', query: args
      end
      alias_method :channels, :channels_list

      def channels_mark(args)
        get 'channels.mark', query: args
      end

      def channels_rename(args)
        get 'channels.rename', query: args
      end

      def channels_set_purpose(args)
        get 'channels.setPurpose', query: args
      end

      def channels_set_topic(args)
        get 'channels.setTopic', query: args
      end

      def channels_unarchive(args)
        get 'channels.unarchive', query: args
      end

      def channel_by_name(name)
        channels.find { |ch| ch.name == name }
      end
    end
  end
end
