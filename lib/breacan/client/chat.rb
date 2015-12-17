module Breacan
  class Client
    module Chat
      def chat_delete(args)
        post 'chat.delete', query: args
      end

      def chat_post_message(args)
        post 'chat.postMessage', query: args
      end

      def chat_update(args)
        post 'chat.update', query: args
      end
    end
  end
end
