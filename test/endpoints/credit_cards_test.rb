module PortaText
  module Test
    module Endpoints
      # Tests the me/dids/:did endpoint.
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Settings < PortaText::Test::Helper::CommandTester
        def test_can_delete_credit_card
          test_command 'credit_cards/44' do |client|
            client
              .credit_cards
              .id(44)
              .delete
          end
        end

        def test_can_get_all_credit_cards
          test_command 'credit_cards' do |client|
            client
              .credit_cards
              .get
          end
        end

        def test_can_create_credit_card
          test_command 'credit_cards', {
            :first_name => 'John',
            :last_name => 'Doe',
            :address => '1234 NW 12TH STREET',
            :city => 'Miami',
            :state => 'FL',
            :zip => '339943',
            :country => 'US',
            :card_number => '400000000000011',
            :card_expiration_date => '2015-12',
            :card_code => '432'
          } do |client|
            client
              .credit_cards
              .name_on_card('John', 'Doe')
              .address('1234 NW 12TH STREET', 'Miami', 'FL', '339943', 'US')
              .card_info('400000000000011', '2015-12', '432')
              .post
          end
        end
      end
    end
  end
end
