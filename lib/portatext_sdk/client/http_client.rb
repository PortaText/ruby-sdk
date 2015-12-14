require 'net/http'
require 'uri'
require 'openssl'

module PortaText
  module Client
    # This class implements the client using Net::HTTP
    #
    # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
    # Copyright:: Copyright (c) 2015 PortaText
    # License::   Apache-2.0
    class HttpClient < BaseClient
      def execute(descriptor)
        uri = URI.parse descriptor.uri
        http = create_http uri
        request = create_request uri, descriptor.method, descriptor.body
        begin
          request! descriptor, http, request
        rescue => e
          raise ::PortaText::Exception::RequestError.new(
            descriptor, nil, e.message, e
          )
        end
      end

      private

      def create_http(uri)
        http = Net::HTTP.new uri.host, uri.port
        http.use_ssl = uri.scheme == 'https'
        http.verify_mode = OpenSSL::SSL::VERIFY_PEER
        http
      end

      def create_request(uri, method, body)
        method = method.to_s.capitalize
        request = Object.const_get("Net::HTTP::#{method}").new uri
        request.body = body
        request
      end

      def request!(descriptor, http, request)
        descriptor.headers.each_pair do |k, v|
          request[k] = v
        end
        result = http.request request
        headers = result.to_hash.each_with_object({}) do |(k, v), acc|
          acc[k.downcase] = v.shift
          acc
        end
        [result.code.to_i, headers, result.body]
      end
    end
  end
end
