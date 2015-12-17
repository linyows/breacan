module Breacan
  class Client
    module Channels
      def channels_archive(args)
        get 'channels.archive', query: args
      end

      def channels_create(args)
        post 'channels.create', query: args
      end

      def channels_history(args)
        get 'channels.history', query: args
      end

      def channels_info(id, options)
        get 'channels.info', query: { channel: id }.merge(options)
      end
      alias_method :channel, :channels_info

      def channels_invite(args)
        post 'channels.invite', query: args
      end

      def channels_join(args)
        post 'channels.join', query: args
      end

      def channels_kick(args)
        post 'channels.kick', query: args
      end

      def channels_leave(args)
        post 'channels.leave', query: args
      end

      def channels_list
        get 'channels.list'
      end
      alias_method :channels, :channels_list

      def channels_mark(args)
        post 'channels.mark', query: args
      end

      def channels_rename(args)
        post 'channels.rename', query: args
      end

      def channels_set_purpose(args)
        post 'channels.setPurpose', query: args
      end

      def channels_set_topic(args)
        post 'channels.setTopic', query: args
      end

      def channels_unarchive(args)
        post 'channels.unarchive', query: args
      end

      def channel_by_name(name)
        channels.find { |ch| ch.name == name }
      end
    end
  end
end
