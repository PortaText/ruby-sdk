module PortaText
  module Test
    module Helper
      # A base class useful to test commands.
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class CommandTester < Minitest::Test
        private

        def test_command(
          assert_endpoint = nil,
          assert_body = '',
          assert_content_type = 'application/json',
          &block
        )
          mock = MiniTest::Mock.new
          if(
            assert_content_type.eql?('application/json') &&
            (assert_body.length > 0)
          )
            assert_body = assert_body.to_json
          end
          mock.expect(:execute, [200, {}, '{"success": true}']) do |descriptor|
            endpoint = "#{PortaText::DEFAULT_ENDPOINT}/#{assert_endpoint}"
            descriptor.uri == endpoint &&
            descriptor.headers['Content-Type'] == assert_content_type &&
            descriptor.body == assert_body
          end

          client = PortaText::Client::BaseClient.new
          client.api_key = 'an_api_key'
          client.executor = mock
          yield client
          assert mock.verify
        end
      end
    end
  end
end
