require 'test_helper'

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
          descriptor.method == :post &&
          descriptor.headers == {
            'Content-Type' => 'application/json',
            'X-Api-Key' => nil,
            'Accept' => 'application/json'
          } &&
          descriptor.body == 'body'
        end
        client = PortaText::Client::BaseClient.new mock
        client.run "some/endpoint", :post, 'application/json', 'body'
        assert mock.verify
      end
    end
  end
end
