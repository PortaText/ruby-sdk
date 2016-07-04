module PortaText
  module Test
    module Endpoints
      # Tests the summary endpoint.
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Summary < PortaText::Test::Helper::CommandTester
        def test_can_get_summary
          test_command 'summary' do |client|
            client
              .summary
              .get
          end
        end

        def test_can_get_summary_by_date_range
          test_command(
            'summary?date_from=2015-01-01T00%3A00%3A00&date_to=2015-05-01T00%3A00%3A00'
          ) do |client|
            client
              .summary
              .from('2015-01-01T00:00:00')
              .to('2015-05-01T00:00:00')
              .get
          end
        end

        def test_can_save_summary_to_csv
          test_command(
            'summary', '', 'application/json', 'text/csv'
          ) do |client|            client
              .summary
              .save_to('/tmp/summary.csv')
              .get
          end
        end
      end
    end
  end
end
