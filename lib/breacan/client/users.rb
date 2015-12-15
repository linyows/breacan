module Breacan
  class Client
    module Users
      def users_get_presence(args)
        get 'users.getPresence', query: args
      end
      alias_method :user_presence, :users_get_presence

      def users_info(id, options = {})
        get 'users.info', query: { user: id }.merge(options)
      end
      alias_method :user, :users_info

      def users_list(args = {})
        get 'users.list', query: args
      end
      alias_method :users, :users_list

      def users_set_active
        get 'users.setActive'
      end
      alias_method :activate_user, :users_set_active

      def users_set_presence(args)
        get 'users.setPresence', query: args
      end
      alias_method :set_user_presence, :users_set_presence

      def user_by_name(name)
        users.find { |u| u if u.name == name }
      end
    end
  end
end
