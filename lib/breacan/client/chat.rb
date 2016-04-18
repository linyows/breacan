module Breacan
  class Client
    module Chat
      def chat_delete(args)
        get 'chat.delete', query: args
      end

      def chat_post_message(args)
        get 'chat.getMessage', query: args
      end

      def chat_update(args)
        get 'chat.update', query: args
      end
    end
  end
end
