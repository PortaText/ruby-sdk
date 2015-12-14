module PortaText
  module Test
    module Endpoints
      # Tests the me/settings endpoint.
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Settings < PortaText::Test::Helper::CommandTester
        def test_can_get_settings
          test_command 'me/settings' do |client|
            client
              .settings
              .get
          end
        end

        def test_can_disable_alert_on_low_credit
          test_command 'me/settings', {
            'alert_when_credit_less_than' => nil
          } do |client|
            client
              .settings
              .dont_alert_on_low_credit
              .patch
          end
        end

        def test_can_enable_alert_on_low_credit
          test_command 'me/settings', {
            'alert_when_credit_less_than' => 100
          } do |client|
            client
              .settings
              .alert_when_credit_less_than(100)
              .patch
          end
        end

        def test_can_enable_email_in_inbound_sms
          test_command 'me/settings', {
            'email_on_inbound_sms' => 'john@doe.com'
          } do |client|
            client
              .settings
              .send_inbound_by_email('john@doe.com')
              .patch
          end
        end

        def test_can_disable_email_in_inbound_sms
          test_command 'me/settings', {
            'email_on_inbound_sms' => nil
          } do |client|
            client
              .settings
              .dont_send_inbound_by_email
              .patch
          end
        end

        def test_can_enable_autorecharges
          test_command 'me/settings', {
            'autorecharge_enabled' => true,
            'autorecharge_plan_id' => 2,
            'autorecharge_card_id' => 66543221,
            'autorecharge_total' => 150,
            'autorecharge_when_credit' => 100
          } do |client|
            client
              .settings
              .enable_autorecharges(100, 66543221, 2, 150)
              .patch
          end
        end

        def test_can_disable_autorecharges
          test_command 'me/settings', {
            'autorecharge_enabled' => false
          } do |client|
            client
              .settings
              .disable_autorecharges
              .patch
          end
        end
      end
    end
  end
end
