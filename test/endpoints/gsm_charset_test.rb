module PortaText
  module Test
    module Endpoints
      # Tests the gsm_charset endpoint.
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class GsmCharset < PortaText::Test::Helper::CommandTester
        def test_can_get_charset
          test_command('gsm_charset') do |client|
            client
              .gsm_charset
              .get
          end
        end
      end
    end
  end
end