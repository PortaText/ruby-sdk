require 'logger'
require 'base64'

module PortaText
  module Client
    # A generic PortaText client.
    #
    # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
    # Copyright:: Copyright (c) 2015 PortaText
    # License::   Apache-2.0
    # rubocop:disable Metrics/ClassLength
    class BaseClient
      attr_writer :endpoint
      attr_writer :api_key
      attr_writer :credentials
      attr_writer :executor
      attr_writer :logger

      def respond_to_missing?(method, *_arguments, &_block)
        defined?(command_class_name method) || super
      end

      def method_missing(method, *_arguments, &_block)
        class_name = command_class_name(method)
        super unless defined?(class_name)
        command = class_name.new
        command.client = self
        command
      end

      def command_class_name(method)
        method = method.to_s.split('_').map(&:capitalize)
        Object.const_get('PortaText')
              .const_get('Command')
              .const_get('Api')
              .const_get(method.join(''))
      end

      # rubocop:disable Metrics/MethodLength
      # rubocop:disable Metrics/AbcSize
      # rubocop:disable Metrics/ParameterLists
      def run(
        endpoint, method, content_type, accept_content_type,
        body, output_file = nil, auth = nil
      )
        true_endpoint = "#{@endpoint}/#{endpoint}"
        auth ||= auth_method(auth)
        headers = form_headers content_type, accept_content_type, auth
        @logger.debug "Calling #{method} #{true_endpoint} with #{auth}"
        descriptor = PortaText::Command::Descriptor.new(
          true_endpoint, method, headers, body, output_file
        )
        ret_code, ret_headers, ret_body = @executor.execute descriptor
        @logger.debug "Got: #{ret_code} / #{ret_headers} / #{ret_body}"
        ret_body = '{}' if ret_body.nil?
        ret_body = JSON.parse ret_body
        result = PortaText::Command::Result.new ret_code, ret_headers, ret_body
        if ret_code.eql?(401) && auth.eql?(:session_token)
          login!
          result = run(
            endpoint, method, content_type, accept_content_type,
            body, output_file, auth
          )
        end
        assert_result descriptor, result
      end
      # rubocop:enable Metrics/MethodLength
      # rubocop:enable Metrics/AbcSize
      # rubocop:enable Metrics/ParameterLists

      def initialize
        @logger = Logger.new nil
        @endpoint = DEFAULT_ENDPOINT
        @api_key = nil
        @credentials = nil
        @session_token = nil
        @executor = self
      end

      private

      def login!
        result = run(
          'login', :post, 'application/json', 'application/json',
          '', nil, :basic
        )
        @session_token = result.data['token']
      end

      def assert_result(descriptor, result)
        error = error_for result.code
        return result if error.nil?
        raise error, [descriptor, result]
      end

      def auth_method(auth_suggested)
        return auth_suggested unless auth_suggested.nil?
        return :session_token unless @session_token.nil?
        return :api_key unless @api_key.nil?
        login!
        :session_token
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
          406 => PortaText::Exception::NotAcceptable,
          415 => PortaText::Exception::InvalidMedia,
          429 => PortaText::Exception::RateLimited,
          500 => PortaText::Exception::ServerError
        }
        errors[code]
      end
      # rubocop:enable Metrics/MethodLength

      # rubocop:disable Metrics/MethodLength
      def form_headers(content_type, accept_content_type, auth)
        headers = {
          'Content-Type' => content_type,
          'Accept' => accept_content_type
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
          raise "Invalid auth type: #{auth}"
        end
        headers
      end
      # rubocop:enable Metrics/ClassLength
    end
  end
end
