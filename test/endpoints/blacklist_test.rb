module PortaText
  module Test
    module Endpoints
      # Tests the blacklist endpoint.
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Blacklist < PortaText::Test::Helper::CommandTester
        def test_can_save_blacklist_to_csv
          test_command 'blacklist/contacts' do |client|
            client
              .blacklist
              .save_to('/tmp/blacklist.csv')
              .get
          end
        end

        def test_can_blacklist_number
          test_command 'blacklist/12223334444' do |client|
            client
              .blacklist
              .number('12223334444')
              .put
          end
        end

        def test_can_unblacklist_number
          test_command 'blacklist/12223334444' do |client|
            client
              .blacklist
              .number('12223334444')
              .delete
          end
        end

        def test_can_blacklist_csv
          test_command(
            'blacklist/contacts', 'file:/tmp/a.csv', 'text/csv'
          ) do |client|
            client
              .blacklist
              .csv('/tmp/a.csv')
              .put
          end
        end
      end
    end
  end
end
