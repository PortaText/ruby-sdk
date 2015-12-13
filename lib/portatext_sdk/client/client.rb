require 'logger'

module PortaText
  module Client
    # A generic PortaText client.
    #
    # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
    # Copyright:: Copyright (c) 2015 PortaText
    # License::   Apache-2.0
    class BaseClient
      attr_writer :logger
      attr_writer :endpoint
      attr_writer :api_key
      attr_writer :credentials

      def execute(_descriptor)
        fail 'You must implement this'
      end

      def initialize
        @logger = ::Logger.new nil
        @endpoint = DEFAULT_ENDPOINT
        @api_key = nil
        @credentials = nil
      end
    end
  end
end
