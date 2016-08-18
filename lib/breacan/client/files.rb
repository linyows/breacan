
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
        set_files_upload_builder
        data = {}
        if args[:file]
          data[:file] = args[:file]
          args.delete(:file)
        end
        data[:query] = args
        res = post 'files.upload', data
        reset_files_upload_builder
        res
      end

      def set_files_upload_builder
        @serializer = Breacan::Client::Files::FileSerializer.any_json
        @middleware = Faraday::RackBuilder.new do |c|
          c.request :multipart
          c.request :url_encoded
          c.adapter :net_http
        end
      end

      def reset_files_upload_builder
        @middleware = default_builder
      end

      class FileSerializer < Sawyer::Serializer
        def encode(data)
          data
        end
      end
    end
  end
end
