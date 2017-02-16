module PortaText
  module Test
    module Endpoints
      # Tests the plans endpoint.
      #
      # Author::    Laura Corvalan (mailto:laura@portatext.com)
      # Copyright:: Copyright (c) 2015- PortaText
      # License::   Apache-2.0
      class Plans < PortaText::Test::Helper::CommandTester
        def test_can_get_all_plans
          test_command 'plans' do |client|
            client
              .plans
              .get
          end
        end

      end
    end
  end
end
