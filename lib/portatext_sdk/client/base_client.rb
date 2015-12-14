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
      attr_writer :endpoint
      attr_writer :api_key
      attr_writer :credentials
      attr_writer :executor

      def run(endpoint, method, content_type, body, auth = nil)
        auth ||= auth_method
        headers = form_headers content_type, auth
        descriptor = PortaText::Command::Descriptor.new(
          "#{@endpoint}/#{endpoint}", method, headers, body
        )
        ret_code, ret_headers, ret_body = @executor.execute descriptor
        result = PortaText::Command::Result.new(
          ret_code, ret_headers, JSON.parse(ret_body)
        )
        assert_result descriptor, result
      end

      def initialize
        @logger = Logger.new nil
        @endpoint = DEFAULT_ENDPOINT
        @api_key = nil
        @credentials = nil
        @session_token = nil
        @executor = self
      end

      private

      def assert_result(descriptor, result)
        error = error_for result.code
        return result if error.nil?
        fail error, [descriptor, result]
      end

      def auth_method
        return :session_token unless @session_token.nil?
        return :basic unless @credentials.nil?
        :api_key
      end

      # rubocop:disable Metrics/MethodLength
      def error_for(code)
        errors = {
          400 => PortaText::Exception::ClientError,
          401 => PortaText::Exception::InvalidCredentials,
          402 => PortaText::Exception::PaymentRequired,
          403 => PortaText::Exception::Forbidden,
          404 => PortaText::Exception::NotFound,
          405 => PortaText::Exception::InvalidMethod,
          415 => PortaText::Exception::InvalidMedia,
          429 => PortaText::Exception::RateLimited,
          500 => PortaText::Exception::ServerError
        }
        errors[code]
      end

      def form_headers(content_type, auth)
        headers = {
          'Content-Type' => content_type,
          'Accept' => 'application/json'
        }
        case auth
        when :session_token
          headers['X-Session-Token'] = @session_token
        when :basic
          auth_string = Base64.encode64 "#{@credentials[0]}:#{@credentials[1]}"
          headers['Authorization'] = "Basic #{auth_string}"
        when :api_key
          headers['X-Api-Key'] = @api_key
        else
          fail "Invalid auth type: #{auth}"
        end
        headers
      end
    end
  end
end
