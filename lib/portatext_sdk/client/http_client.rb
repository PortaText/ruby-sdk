require 'net/http'
require 'uri'

module PortaText
  module Client
    # This class implements the client using Net::HTTP
    #
    # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
    # Copyright:: Copyright (c) 2015 PortaText
    # License::   Apache-2.0
    class HttpClient < BaseClient
      def execute(descriptor)
        _uri = URI.parse descriptor.uri
      end

      def initialize
        super
      end
    end
  end
end
