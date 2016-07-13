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
        return 'audio/mpeg' unless @args[:sound_file].nil?
        'application/json'
      end

      def accept_content_type(_method)
        return '*/*' unless @args[:accept_any_file].nil?
        return 'text/csv' unless @args[:accept_file].nil?
        return 'audio/mpeg' unless @args[:accept_sound_file].nil?
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

      # rubocop:disable Metrics/MethodLength
      def run(method)
        a_type = accept_content_type method
        command_endpoint = endpoint(method)
        file = @args[:accept_file]
        file ||= @args[:accept_any_file]
        file ||= @args[:accept_sound_file]
        @args.delete :accept_file
        @args.delete :accept_any_file
        @args.delete :accept_sound_file
        @client.run(
          command_endpoint, method, content_type(method),
          a_type, body(method), file
        )
      end
      # rubocop:enable Metrics/MethodLength
    end
  end
end
