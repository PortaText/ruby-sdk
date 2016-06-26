module PortaText
  module Test
    module Endpoints
      # Tests the version endpoint.
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Version < PortaText::Test::Helper::CommandTester
        def test_can_get_version
          test_command 'version' do |client|
            client
              .version
              .get
          end
        end
      end
    end
  end
end
