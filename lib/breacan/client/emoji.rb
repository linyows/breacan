module Breacan
  class Client
    module Emoji
      def emoji_list
        get 'emoji.list'
      end
    end
  end
end
