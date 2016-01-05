module PortaText
  module Test
    module Endpoints
      # Tests the me/password endpoint.
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class MyPassword < PortaText::Test::Helper::CommandTester
        def test_can_ask_to_reset_password
          test_command 'me/password/reset', {
            'email' => 'john@doe.com'
          } do |client|
            client
              .my_password
              .reset
              .for_email('john@doe.com')
              .post
          end
        end

        def test_can_reset_password_with_a_nonce
          test_command 'me/password/reset/a_nonce', {
            'new_password' => 'new_password4$$'
          } do |client|
            client
              .my_password
              .reset
              .with_nonce('a_nonce', 'new_password4$$')
              .put
          end
        end

        def test_can_change_password
          test_command 'me/password', {
            'old_password' => 'my_current_password',
            'new_password' => 'some_new_password'
          } do |client|
            client
              .my_password
              .change('my_current_password', 'some_new_password')
              .put
          end
        end
      end
    end
  end
end
