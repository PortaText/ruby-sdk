require 'json'

module PortaText
  module Command
    # The base command class.
    #
    # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
    # Copyright:: Copyright (c) 2015 PortaText
    # License::   Apache-2.0
    class Base
      attr_writer :client

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

      def set(key, value)
        @args[key] = value
        self
      end

      def content_type(_method)
        return 'text/csv' unless @args[:file].nil?
        'application/json'
      end

      def body(_method)
        return "file:#{@args[:file]}" unless @args[:file].nil?
        return '' if @args.size.eql? 0
        @args.to_json
      end

      def initialize
        @args = {}
      end

      private

      def run(method)
        @client.run endpoint(method), method, content_type(method), body(method)
      end
    end
  end
end
