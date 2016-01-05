module PortaText
  module Test
    module Endpoints
      # Tests the me/password endpoint.
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class MyPassword < PortaText::Test::Helper::CommandTester
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
