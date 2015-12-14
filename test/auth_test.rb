require 'test_helper'
require 'base64'

module PortaText
  module Test
    # Tests the auth logic in base client implementation.
    #
    # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
    # Copyright:: Copyright (c) 2015 PortaText
    # License::   Apache-2.0
    class Auth < Minitest::Test
      def test_can_auto_login_and_renew_session_token
        mock = MiniTest::Mock.new

        mock.expect(:execute, [200, {}, '{"token": "a_token"}']) do |descriptor|
          _auth_type, auth = descriptor.headers['Authorization'].split ' '
          username, password = Base64.decode64(auth).split ':'

          username == "username" &&
          password == "password" &&
          descriptor.uri == "#{PortaText::DEFAULT_ENDPOINT}/login" &&
          descriptor.method == :post &&
          descriptor.headers['Content-Type'] == 'application/json' &&
          descriptor.headers['Accept'] == 'application/json' &&
          descriptor.body == ''
        end

        mock.expect(:execute, [401, {}, '{}']) do |descriptor|
          descriptor.uri == "#{PortaText::DEFAULT_ENDPOINT}/some/endpoint" &&
          descriptor.method == :post &&
          descriptor.headers['Content-Type'] == 'application/json' &&
          descriptor.headers['Accept'] == 'application/json' &&
          descriptor.headers['X-Session-Token'] == 'a_token' &&
          descriptor.body == 'body'
        end

        mock.expect(:execute, [200, {}, '{"token": "a_token"}']) do |descriptor|
          _auth_type, auth = descriptor.headers['Authorization'].split ' '
          username, password = Base64.decode64(auth).split ':'

          username == "username" &&
          password == "password" &&
          descriptor.uri == "#{PortaText::DEFAULT_ENDPOINT}/login" &&
          descriptor.method == :post &&
          descriptor.headers['Content-Type'] == 'application/json' &&
          descriptor.headers['Accept'] == 'application/json' &&
          descriptor.body == ''
        end

        mock.expect(:execute, [200, {}, '{}']) do |descriptor|
          descriptor.uri == "#{PortaText::DEFAULT_ENDPOINT}/some/endpoint" &&
          descriptor.method == :post &&
          descriptor.headers['Content-Type'] == 'application/json' &&
          descriptor.headers['Accept'] == 'application/json' &&
          descriptor.headers['X-Session-Token'] == 'a_token' &&
          descriptor.body == 'body'
        end

        mock.expect(:execute, [200, {}, '{}']) do |descriptor|
          descriptor.uri == "#{PortaText::DEFAULT_ENDPOINT}/some/endpoint" &&
          descriptor.method == :post &&
          descriptor.headers['Content-Type'] == 'application/json' &&
          descriptor.headers['Accept'] == 'application/json' &&
          descriptor.headers['X-Session-Token'] == 'a_token' &&
          descriptor.body == 'body'
        end

        client = PortaText::Client::BaseClient.new
        client.credentials = ["username", "password"]
        client.executor = mock
        client.run "some/endpoint", :post, 'application/json', 'body'
        client.run "some/endpoint", :post, 'application/json', 'body'
        assert mock.verify
      end

      def test_cant_use_unknown_auth_method
        client = PortaText::Client::BaseClient.new
        assert_raises RuntimeError do
          client.run "some/endpoint", :post, 'application/json', 'body', 'derp'
        end
      end

      def test_credentials_auth
        mock = MiniTest::Mock.new
        mock.expect(:execute, [200, {}, '{}']) do |descriptor|
          _auth_type, auth = descriptor.headers['Authorization'].split ' '
          username, password = Base64.decode64(auth).split ':'

          username == "username" &&
          password == "password" &&
          descriptor.uri == "#{PortaText::DEFAULT_ENDPOINT}/some/endpoint" &&
          descriptor.method == :post &&
          descriptor.headers['Content-Type'] == 'application/json' &&
          descriptor.headers['Accept'] == 'application/json' &&
          descriptor.body == 'body'
        end
        client = PortaText::Client::BaseClient.new
        client.credentials = ["username", "password"]
        client.executor = mock
        client.run "some/endpoint", :post, 'application/json', 'body', :basic
        assert mock.verify
      end

      def test_api_key_auth
        mock = MiniTest::Mock.new
        mock.expect(:execute, [200, {}, '{}']) do |descriptor|
          descriptor.uri == "#{PortaText::DEFAULT_ENDPOINT}/some/endpoint" &&
          descriptor.method == :post &&
          descriptor.headers == {
            'Content-Type' => 'application/json',
            'X-Api-Key' => 'an_api_key',
            'Accept' => 'application/json'
          } &&
          descriptor.body == 'body'
        end
        client = PortaText::Client::BaseClient.new
        client.api_key = 'an_api_key'
        client.executor = mock
        client.run "some/endpoint", :post, 'application/json', 'body'
        assert mock.verify
      end
    end
  end
end
