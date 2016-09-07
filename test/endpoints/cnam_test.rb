module PortaText
  module Test
    module Endpoints
      # Tests the cnam endpoint.
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Cnam < PortaText::Test::Helper::CommandTester
        def test_cannot_cnam_for_null_did
          assert_raises RuntimeError do
            test_command do |client|
              client
                .cnam
                .post
            end
          end
        end

        def test_can_request_cnam
          test_command 'cnam/12223334444' do |client|
            client
              .cnam
              .for_number('12223334444')
              .post
          end
        end

        def test_can_query_with_csv
          test_command('cnam', 'file:/tmp/a.csv', 'text/csv') do |client|
            client
              .cnam
              .csv('/tmp/a.csv')
              .post
          end
        end
      end
    end
  end
end
