module Breacan
  class Client
    module Files
      def files_delete(args)
        get 'files.delete', query: args
      end

      def files_info(args)
        get 'files.info', query: args
      end

      def files_list(args)
        get 'files.list', query: args
      end

      def files_upload(args)
        # content_type = 'multipart/form-data'
        # get 'files.upload', query: args
      end
    end
  end
end
