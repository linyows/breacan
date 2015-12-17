module Breacan
  class Client
    module Groups
      def groups_archive(args)
        get 'groups.archive', query: args
      end

      def groups_create(args)
        post 'groups.create', query: args
      end

      def groups_history(args)
        get 'groups.history', query: args
      end

      def groups_info(args)
        get 'groups.info', query: args
      end

      def groups_invite(args)
        post 'groups.invite', query: args
      end

      def groups_join(args)
        post 'groups.join', query: args
      end

      def groups_kick(args)
        post 'groups.kick', query: args
      end

      def groups_leave(args)
        post 'groups.leave', query: args
      end

      def groups_list
        get 'groups.list'
      end

      def groups_mark(args)
        post 'groups.mark', query: args
      end

      def groups_rename(args)
        post 'groups.rename', query: args
      end

      def groups_set_purpose(args)
        post 'groups.setPurpose', query: args
      end

      def groups_set_topic(args)
        post 'groups.setTopic', query: args
      end

      def groups_unarchive(args)
        post 'groups.unarchive', query: args
      end

      def groups_info_by_name(name)
        groups_list.find { |ch| ch['name'] == name }
      end
    end
  end
end
