require 'json'

module PortaText
  module Command
    # The base command class.
    #
    # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
    # Copyright:: Copyright (c) 2015 PortaText
    # License::   Apache-2.0
    class Base
      def get
        run :get
      end

      def post
        run :post
      end

      def put
        run :put
      end

      def patch
        run :patch
      end

      def delete
        run :delete
      end

      def content_type(_method)
        'application/json'
      end

      def body(_method)
        return '' if @args.size.eql? 0
        @args.to_json
      end

      def initialize(client)
        @client = client
        @args = {}
      end

      private

      def run(method)
        @client.run endpoint(method), method, content_type(method), body(method)
      end
    end
  end
end
