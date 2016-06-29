module PortaText
  module Test
    module Endpoints
      # Tests the destinations endpoint.
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Destinations < PortaText::Test::Helper::CommandTester
        def test_can_paginate_results
          test_command(
            'destinations?page=4&sort_by=destination&order=desc'
          ) do |client|
            client
              .destinations
              .page(4)
              .sort_by('destination', 'desc')
              .get
          end
        end
        def test_can_get_all_destinations
          test_command('destinations') do |client|
            client
              .destinations
              .get
          end
        end
      end
    end
  end
end