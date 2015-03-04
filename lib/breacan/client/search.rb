module Breacan
  class Client
    module Search
      def search_all(args)
        get 'serach.all', query: args
      end

      def search_files(args)
        get 'serach.files', query: args
      end

      def search_messages(args)
        get 'serach.messages', query: args
      end
    end
  end
end
