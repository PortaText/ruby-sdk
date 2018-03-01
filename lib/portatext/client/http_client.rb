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
        rescue StandardError => e
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

      # rubocop:disable Metrics/MethodLength
      def create_request(uri, method, body)
        method = method.to_s.capitalize
        request = Object.const_get('Net')
                        .const_get('HTTP')
                        .const_get(method)
                        .new uri
        data = /^file:(.*)$/.match(body)
        if data.nil?
          request.body = body
        else
          file = data.captures.shift
          request.content_length = File.size file
          request.body_stream = File.open file, 'r'
        end
        request
      end
      # rubocop:enable Metrics/MethodLength

      def writer_proc(file)
        if file.nil?
          nil
        else
          proc do |response|
            open file, 'w+' do |io|
              response.read_body { |chunk| io.write chunk }
            end
          end
        end
      end

      def normalize_headers(result)
        result.to_hash.each_with_object({}) do |(k, v), acc|
          acc[k.downcase] = v.shift
          acc
        end
      end

      def request!(descriptor, http, request)
        descriptor.headers.each_pair { |k, v| request[k] = v }
        body = nil
        result = http.request request, &(writer_proc descriptor.output_file)
        body = result.body if descriptor.output_file.nil?
        [result.code.to_i, normalize_headers(result), body]
      end
    end
  end
end
