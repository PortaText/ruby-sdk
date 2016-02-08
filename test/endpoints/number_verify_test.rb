module PortaText
  module Test
    module Endpoints
      # Tests the verify number endpoint.
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Cnam < PortaText::Test::Helper::CommandTester
        def test_cannot_verify_null_number
          assert_raises RuntimeError do
            test_command do |client|
              client
                .number_verify
                .post
            end
          end
        end

        def test_can_send_verification_code
          test_command 'number_verify/12223334444', {
            :from => "13334445555",
            :template_id => 44,
            :variables => { :var1 => 'value' }
          } do |client|
            client
              .number_verify
              .for_number("12223334444")
              .from("13334445555")
              .use_template(44, { :var1 => 'value' })
              .post
          end
        end

        def test_can_verify_number
          test_command 'number_verify/12223334444?code=123456' do |client|
            client
              .number_verify
              .for_number("12223334444")
              .verify_with("123456")
              .get
          end
        end
      end
    end
  end
end
