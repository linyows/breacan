module Breacan
  class Client
    module Usergroups
      def usergroups_create(args)
        post 'usergroups.create', query: args
      end
      alias_method :create_usergroup, :usergroups_create

      def usergroups_disable(args)
        post 'usergroups.disable', query: args
      end
      alias_method :disable_usergroup, :usergroups_disable

      def usergroups_enable(args)
        post 'usergroups.enable', query: args
      end
      alias_method :enable_usergroup, :usergroups_enable

      def usergroups_list(args = {})
        get 'usergroups.list', query: args
      end
      alias_method :usergroups, :usergroups_list

      def usergroups_update(args)
        post 'usergroups.update', query: args
      end
      alias_method :update_usergroup, :usergroups_update

      def usergroups_users_list(id, options = {})
        get 'usergroups.users.list', query: { usergroup: id }.merge(options)
      end
      alias_method :usergroup_users, :usergroups_users_list

      def usergroups_users_update(args)
        post 'usergroups.users.update', query: args
      end
      alias_method :update_usergroup_users, :usergroups_users_update
    end
  end
end
