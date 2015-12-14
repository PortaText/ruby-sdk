module PortaText
  module Test
    module Endpoints
      # Tests the timezones endpoint.
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Timezones < PortaText::Test::Helper::CommandTester
        def test_can_get_all_timezones
          test_command 'timezones' do |client|
            client
              .timezones
              .get
          end
        end
      end
    end
  end
end
