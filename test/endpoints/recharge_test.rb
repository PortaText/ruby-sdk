module PortaText
  module Test
    module Endpoints
      # Tests the recharge endpoint.
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Recharge < PortaText::Test::Helper::CommandTester
        def test_can_recharge
          test_command 'recharge', {
            :card_id => 445522,
            :total => 150
          } do |client|
            client
              .recharge
              .with_card(445522)
              .total(150)
              .post
          end
        end
      end
    end
  end
end
