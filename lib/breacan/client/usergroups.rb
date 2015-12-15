module Breacan
  class Client
    module Usergroups
      def usergroups_create(args)
        get 'usergroups.create', query: args
      end
      alias_method :create_usergroup, :usergroups_create

      def usergroups_disable(args)
        get 'usergroups.disable', query: args
      end
      alias_method :disable_usergroup, :usergroups_disable

      def usergroups_enable(args)
        get 'usergroups.enable', query: args
      end
      alias_method :enable_usergroup, :usergroups_enable

      def usergroups_list(id, options = {})
        get 'usergroups.list', query: { usergroup: id }.merge(options)
      end
      alias_method :usergroups, :usergroups_list

      def usergroups_update(args)
        get 'usergroups.update', query: args
      end
      alias_method :update_usergroup, :usergroups_update

      def usergroups_users_list(args)
        get 'usergroups.users.list', query: args
      end
      alias_method :usergroup_users, :usergroups_users_list

      def usergroups_users_update(args)
        get 'usergroups.users.update', query: args
      end
      alias_method :update_usergroup_users, :usergroups_users_update
    end
  end
end
