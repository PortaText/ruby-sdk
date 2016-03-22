module PortaText
  module Test
    module Endpoints
      # Tests the sms endpoint.
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Sms < PortaText::Test::Helper::CommandTester
        def test_can_send_to_contact_lists
          test_command 'sms', {
            :from => '12223334444',
            :contact_list_ids => [1, 2],
            :template_id => 44,
            :variables => { :var1 => 'value' },
            :client_ref => 'custom_client_ref'
          } do |client|
            client
              .sms
              .from('12223334444')
              .to_contact_lists([1, 2])
              .use_template(44, { :var1 => 'value' })
              .client_ref('custom_client_ref')
              .post
          end
        end

        def test_can_send_message_with_template
          test_command 'sms', {
            :from => '12223334444',
            :to => '15556667777',
            :template_id => 44,
            :variables => { :var1 => 'value' },
            :client_ref => 'custom_client_ref'
          } do |client|
            client
              .sms
              .from('12223334444')
              .to('15556667777')
              .use_template(44, { :var1 => 'value' })
              .client_ref('custom_client_ref')
              .post
          end
        end

        def test_can_send_message_with_text
          test_command 'sms', {
            :from => '12223334444',
            :to => '15556667777',
            :text => 'hello world',
            :client_ref => 'custom_client_ref'
          } do |client|
            client
              .sms
              .from('12223334444')
              .to('15556667777')
              .text('hello world')
              .client_ref('custom_client_ref')
              .post
          end
        end

        def test_can_send_from_sms_service
          test_command 'sms', {
            :service_id => 55,
            :to => '15556667777',
            :text => 'hello world',
            :client_ref => 'custom_client_ref'
          } do |client|
            client
              .sms
              .from_service(55)
              .to('15556667777')
              .text('hello world')
              .client_ref('custom_client_ref')
              .post
          end
        end

        def test_can_get_sms_operation
          test_command 'sms/763' do |client|
            client
              .sms
              .id(763)
              .get
          end
        end
      end
    end
  end
end
