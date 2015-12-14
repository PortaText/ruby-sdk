module PortaText
  module Test
    module Endpoints
      # Tests the tariffs endpoint.
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Tariffs < PortaText::Test::Helper::CommandTester
        def test_can_get_all_tarifs
          test_command 'tariffs' do |client|
            client
              .tariffs
              .get
          end
        end

        def test_can_get_tarifs_for_country
          test_command 'tariffs/us' do |client|
            client
              .tariffs
              .for_country('us')
              .get
          end
        end
      end
    end
  end
end
