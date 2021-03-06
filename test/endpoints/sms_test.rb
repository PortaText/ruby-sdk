module PortaText
  module Test
    module Endpoints
      # Tests the sms endpoint.
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Sms < PortaText::Test::Helper::CommandTester
        def test_can_search_for_sms_operations
          test_command(
            'sms?page=3&date_from=2015-01-01T00%3A00%3A00'
          ) do |client|
            client
              .sms
              .search({
                page: 3,
                date_from: '2015-01-01T00:00:00'
              })
              .get
          end
        end

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

        def test_can_schedule_message
          test_command 'sms', {
            :from => '12223334444',
            :to => '15556667777',
            :text => 'hello world',
            :schedule => {
              :any_day => {
                :from => '15:00',
                :to => '17:30'
              }
            }
          } do |client|
            client
              .sms
              .from('12223334444')
              .to('15556667777')
              .text('hello world')
              .schedule('any_day', {:from => '15:00', :to => '17:30'})
              .post
          end
        end

        def test_can_send_message_with_any_as_from
          test_command 'sms', {
            :from => 'any',
            :to => '15556667777',
            :text => 'hello world'
          } do |client|
            client
              .sms
              .from('any')
              .to('15556667777')
              .text('hello world')
              .post
          end
        end

        def test_can_send_message_with_list_as_from
          test_command 'sms', {
            :from => ['12223334444', '12223334445', '12223334446'],
            :to => '15556667777',
            :text => 'hello world'
          } do |client|
            client
              .sms
              .from(['12223334444', '12223334445', '12223334446'])
              .to('15556667777')
              .text('hello world')
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
