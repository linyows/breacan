module Breacan
  class Client
    module Groups
      def groups_archive(args)
        get 'groups.archive', query: args
      end

      def groups_create(args)
        get 'groups.create', query: args
      end

      def groups_history(args)
        get 'groups.history', query: args
      end

      def groups_info(args)
        get 'groups.info', query: args
      end

      def groups_info(args)
        get 'groups.info', query: args
      end

      def groups_invite(args)
        get 'groups.invite', query: args
      end

      def groups_join(args)
        get 'groups.join', query: args
      end

      def groups_kick(args)
        get 'groups.kick', query: args
      end

      def groups_leave(args)
        get 'groups.leave', query: args
      end

      def groups_list
        get 'groups.list'
      end

      def groups_mark(args)
        get 'groups.mark', query: args
      end
      def groups_rename(args)
        get 'groups.rename', query: args
      end
      def groups_set_purpose(args)
        get 'groups.setPurpose', query: args
      end
      def groups_set_topic(args)
        get 'groups.setTopic', query: args
      end
      def groups_unarchive(args)
        get 'groups.unarchive', query: args
      end

      def groups_info_by_name(name)
        res = groups_list
        res.groups.find { |ch| ch['name'] == name } if res.ok
      end
    end
  end
end
