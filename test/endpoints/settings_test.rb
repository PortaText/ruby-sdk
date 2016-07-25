module PortaText
  module Test
    module Endpoints
      # Tests the me/settings endpoint.
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Settings < PortaText::Test::Helper::CommandTester
        def test_can_set_amd_settings
          test_command 'me/settings', {
            'amd_initial_silence' => 900,
            'amd_max_greeting_length' => 800,
            'amd_after_greeting_silence' => 700,
            'amd_total_time' => 600,
            'amd_min_word_length' => 500,
            'amd_between_words_silence' => 400,
            'amd_max_words' => 300,
            'amd_silence_threshold' => 200,
            'amd_max_word_length' =>  100
          } do |client|
            client
              .settings
              .amd_initial_silence(900)
              .amd_max_greeting_length(800)
              .amd_after_greeting_silence(700)
              .amd_total_time(600)
              .amd_min_word_length(500)
              .amd_between_words_silence(400)
              .amd_max_words(300)
              .amd_silence_threshold(200)
              .amd_max_word_length(100)
              .patch
          end
        end

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
            'autorecharge_total' => 5000,
            'autorecharge_when_credit' => 100
          } do |client|
            client
              .settings
              .enable_autorecharges(100, 5000)
              .patch
          end
        end

        def test_can_set_default_credit_card
          test_command 'me/settings', {
            'default_card_id' => 66543221
          } do |client|
            client
              .settings
              .default_credit_card(66543221)
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
