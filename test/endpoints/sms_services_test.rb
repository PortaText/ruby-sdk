module PortaText
  module Test
    module Endpoints
      # Tests the sms_services endpoint.
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class SmsServices < PortaText::Test::Helper::CommandTester
        def test_can_save_subscribers_list_to_csv
          test_command(
            'sms_services/33/subscribers', '', 'application/json', 'text/csv'
          ) do |client|
            client
              .services
              .id(33)
              .save_to('/tmp/contact_list.csv')
              .get
          end
        end

        def test_can_paginate_subscribers
          test_command('sms_services/33/subscribers?page=55') do |client|
            client
              .services
              .id(33)
              .page(55)
              .get
          end
        end

        def test_can_get_all_sms_services
          test_command('sms_services') do |client|
            client
              .services
              .get
          end
        end

        def test_can_get_one_sms_service
          test_command('sms_services/33') do |client|
            client
              .services
              .id(33)
              .get
          end
        end
      end
    end
  end
end
