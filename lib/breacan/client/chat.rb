module Breacan
  class Client
    module Chat
      def chat_delete(*args)
        delete 'chat.delete', args
      end

      def chat_post_message(*args)
        get 'chat.postMessage', args
      end

      def chat_update(*args)
        get 'chat.update', args
      end
    end
  end
end
