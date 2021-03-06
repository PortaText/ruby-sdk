require 'test_helper'
require 'base64'

module PortaText
  module Test
    # Tests the base client implementation.
    #
    # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
    # Copyright:: Copyright (c) 2015 PortaText
    # License::   Apache-2.0
    class BaseClient < Minitest::Test
      def test_api_key_auth
        mock = MiniTest::Mock.new
        mock.expect(:execute, [200, {}, '{}']) do |descriptor|
          descriptor.uri == "#{PortaText::DEFAULT_ENDPOINT}/some/endpoint" &&
          descriptor.method == :method &&
          descriptor.headers == {
            'Content-Type' => 'some/type',
            'X-Api-Key' => 'an_api_key',
            'Accept' => 'other/type'
          } &&
          descriptor.body == 'body' &&
          descriptor.output_file == 'output_file'
        end
        client = PortaText::Client::BaseClient.new
        client.api_key = 'an_api_key'
        client.executor = mock
        client.run(
          'some/endpoint', :method, 'some/type',
          'other/type', 'body', 'output_file'
        )
        assert mock.verify
      end
    end
  end
end
