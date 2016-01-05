module PortaText
  module Test
    module Endpoints
      # Tests the me/email_verify endpoint.
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class EmailVerify < PortaText::Test::Helper::CommandTester
        def test_can_request_email_verification
          test_command 'me/email_verify' do |client|
            client
              .email_verify
              .post
          end
        end

        def test_can_verify_email
          test_command 'me/email_verify/a_nonce' do |client|
            client
              .email_verify
              .with_nonce('a_nonce')
              .post
          end
        end
      end
    end
  end
end
