module PortaText
  module Test
    module Endpoints
      # Tests the inspect endpoint.
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Inspect < PortaText::Test::Helper::CommandTester
        def test_can_inspect_number
          test_command('inspect/12223334444') do |client|
            client
              .number_inspect
              .number('12223334444')
              .post
          end
        end

        def test_can_inspect_csv
          test_command('inspect', 'file:/tmp/a.csv', 'text/csv') do |client|
            client
              .number_inspect
              .csv('/tmp/a.csv')
              .post
          end
        end
      end
    end
  end
end
