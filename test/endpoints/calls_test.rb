module PortaText
  module Test
    module Endpoints
      # Tests the calls endpoint.
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Calls < PortaText::Test::Helper::CommandTester
        def test_can_search_for_calls_operations
          test_command(
            'calls?page=1&date_from=2017-03-01T16%3A00%3A00'
          ) do |client|
            client
              .calls
              .search({
                page: 1,
                date_from: '2017-03-01T16:00:00'
              })
              .get
          end
        end

        def test_can_isse_call
          test_command 'calls', {
            :from => '12223334444',
            :to => '14445556666',
            :outbound_trunk_id => 33,
            :dial_timeout => 120,
            :flow => [
              {:wait => {
                :seconds => 120
              }},
              {:play => {
                :sound_id => 3
              }}
            ]
          } do |client|
            client
              .calls
              .from('12223334444')
              .to('14445556666')
              .outbound_trunk_id(33)
              .dial_timeout(120)
              .flow([
                {:wait => {
                  :seconds => 120
                }},
                {:play => {
                  :sound_id => 3
                }}
              ]).post
          end
        end
      end
    end
  end
end
