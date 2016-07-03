module PortaText
  module Test
    module Endpoints
      # Tests the simulate endpoint.
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Simulate < PortaText::Test::Helper::CommandTester
        def test_can_simulate_message_with_template
          test_command 'simulate', {
            :country => 'us',
            :template_id => 44,
            :variables => { :var1 => 'value' }
          } do |client|
            client
              .simulate
              .country('us')
              .use_template(44, { :var1 => 'value' })
              .get
          end
        end

        def test_can_simulate_message_with_text
          test_command 'simulate', {
            :country => 'us',
            :text => 'hello world'
          } do |client|
            client
              .simulate
              .country('us')
              .text('hello world')
              .get
          end
        end
      end
    end
  end
end
