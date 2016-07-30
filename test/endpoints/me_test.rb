module PortaText
  module Test
    module Endpoints
      # Tests the me endpoint.
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Me < PortaText::Test::Helper::CommandTester
        def test_can_get_me
          test_command 'me' do |client|
            client
              .me
              .get
          end
        end

        def test_can_put_me
          test_command 'me', {
            'first_name' => 'John',
            'last_name' => 'Doe',
            'email' => 'john@doe.com',
            'company' => 'Mr. spiffy',
            'callback_url' => nil,
            'timezone' => 'UTC',
            'language' => 'es'
          } do |client|
            client
              .me
              .name('John', 'Doe')
              .email('john@doe.com')
              .company('Mr. spiffy')
              .callback_url(nil)
              .timezone('UTC')
              .language('es')
              .put
          end
        end
      end
    end
  end
end
