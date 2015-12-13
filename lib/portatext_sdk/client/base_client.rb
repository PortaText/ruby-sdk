require 'logger'
require 'base64'

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

      def run(endpoint, method, content_type, body, auth = nil)
        auth ||= auth_method
        headers = form_headers content_type, auth
        uri = "#{@endpoint}/#{endpoint}"
        descriptor = PortaText::Command::Descriptor.new(
          uri, method, headers, body
        )
        ret_code, ret_headers, ret_body = @implementation.execute descriptor
        PortaText::Command::Result.new(
          ret_code, ret_headers, JSON.parse(ret_body)
        )
      end

      def initialize(execution_implementation)
        @logger = ::Logger.new nil
        @endpoint = DEFAULT_ENDPOINT
        @api_key = nil
        @credentials = nil
        @session_token = nil
        @implementation = execution_implementation
      end

      private

      # rubocop:disable Metrics/MethodLength
      def form_headers(content_type, auth)
        headers = {
          'Content-Type' => content_type,
          'Accept' => 'application/json'
        }
        case auth
        when :session_token
          headers['X-Session-Token'] = @session_token
        when :basic
          auth_string = Base64.encode "#{@credentials[0]}:#{@credentials[1]}"
          headers['Authorization'] = "Basic #{auth_string}"
        when :api_key
          headers['X-Api-Key'] = @api_key
        else
          fail "Invalid auth type: #{auth}"
        end
        headers
      end

      def auth_method
        return :session_token unless @session_token.nil?
        return :basic unless @credentials.nil?
        :api_key
      end
    end
  end
end
