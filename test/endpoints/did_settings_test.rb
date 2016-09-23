module PortaText
  module Test
    module Endpoints
      # Tests the dids/:did endpoint.
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class DidSettings < PortaText::Test::Helper::CommandTester
        def test_can_enable_stop_words
          test_command 'dids/12223334444', {
            :stop_words_enabled => true
          } do |client|
            client
              .did_settings
              .for_number('12223334444')
              .enable_stop_words
              .patch
          end
        end

        def test_can_disable_stop_words
          test_command 'dids/12223334444', {
            :stop_words_enabled => false
          } do |client|
            client
              .did_settings
              .for_number('12223334444')
              .disable_stop_words
              .patch
          end
        end

        def test_can_get_all_dids
          test_command 'dids' do |client|
            client
              .did_settings
              .get
          end
        end

        def test_can_get_one_did
          test_command 'dids/12223334444' do |client|
            client
              .did_settings
              .for_number('12223334444')
              .get
          end
        end

        def test_can_enable_cnam
          test_command 'dids/12223334444', {
            :cnam_enabled => true
          } do |client|
            client
              .did_settings
              .for_number('12223334444')
              .enable_cnam
              .patch
          end
        end

        def test_can_disable_cnam
          test_command 'dids/12223334444', {
            :cnam_enabled => false
          } do |client|
            client
              .did_settings
              .for_number('12223334444')
              .disable_cnam
              .patch
          end
        end

        def test_can_disable_autoresponder
          test_command 'dids/12223334444', {
            :autoresponder_enabled => false
          } do |client|
            client
              .did_settings
              .for_number('12223334444')
              .dont_autorespond
              .patch
          end
        end

        def test_can_enable_autoresponder
          test_command 'dids/12223334444', {
            :autoresponder_text => 'Thanks for contacting us',
            :autoresponder_enabled => true
          } do |client|
            client
              .did_settings
              .for_number('12223334444')
              .autorespond_with('Thanks for contacting us')
              .patch
          end
        end
      end
    end
  end
end
