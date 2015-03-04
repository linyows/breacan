module Breacan
  class Client
    module Users
      def users_get_presence(args)
        get 'users.getPresence', query: args
      end

      def users_info(args)
        get 'users.info', query: args
      end

      def users_list(args)
        get 'users.list', query: args
      end

      def users_set_active(args)
        get 'users.setActive', query: args
      end

      def users_set_presence(args)
        get 'users.setPresence', query: args
      end
    end
  end
end
