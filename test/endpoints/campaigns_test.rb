module PortaText
  module Test
    module Endpoints
      # Tests the campaigns endpoint.
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Campaign < PortaText::Test::Helper::CommandTester
        def test_can_create_telephony_campaign
          test_command 'campaigns', {
            :type => 'telephony',
            :name => 'this is the name',
            :description => 'and this is the description',
            :contact_list_ids => [1, 3, 5, 7, 9],
            :from => '12223334444',
            :settings => {
              :iterations => 3,
              :agents => 20,
              :post_call_work_duration => 15,
              :min_iteration_time => 5,
              :outbound_trunk_id => 33
            }
          } do |client|
            client
              .tel_campaign
              .name('this is the name')
              .description('and this is the description')
              .to_contact_lists([1, 3, 5, 7, 9])
              .from('12223334444')
              .iterations(3)
              .agents(20)
              .post_call_work_duration(15)
              .min_iteration_time(5)
              .outbound_trunk_id(33)
              .post
          end
        end

        def test_can_get_paginated_campaigns_list
          test_command('campaigns?page=44') do |client|
            client
              .campaigns
              .page(44)
              .get
          end
        end

        def test_can_export_all_contacts_to_csv
          test_command(
            'campaigns/123/contacts?', '', 'application/json', 'text/csv'
          ) do |client|
            client
              .campaigns
              .id(123)
              .contacts
              .save_to('/tmp/contacts.csv')
              .get
          end
        end

        def test_can_paginate_contacts
          test_command('campaigns/123/contacts?page=44') do |client|
            client
              .campaigns
              .id(123)
              .contacts
              .page(44)
              .get
          end
        end

        def test_can_create_sms_campaign_from_csv
          settings = {
            :type => 'sms',
            :name => 'this is the name',
            :description => 'and this is the description',
            :from => '12223334444',
            :settings => {
              :text => 'Hello world'
            }
          }.to_json
          test_command(
            "campaigns?#{URI.encode_www_form('settings' => settings)}",
            'file:/tmp/contacts.csv',
            'text/csv'
          ) do |client|
            client
              .sms_campaign
              .name('this is the name')
              .description('and this is the description')
              .csv('/tmp/contacts.csv')
              .from('12223334444')
              .text('Hello world')
              .post
          end
        end

        def test_can_schedule_sms_campaign
          test_command 'campaigns', {
            :type => 'sms',
            :name => 'this is the name',
            :description => 'and this is the description',
            :contact_list_ids => [1, 3, 5, 7, 9],
            :from => '12223334444',
            :settings => {
              :text => 'Hello world'
            },
            :schedule => {
              :any_day => {
                :from => '21:33',
                :to => '23:15'
              }
            }
          } do |client|
            client
              .sms_campaign
              .name('this is the name')
              .description('and this is the description')
              .to_contact_lists([1, 3, 5, 7, 9])
              .from('12223334444')
              .text('Hello world')
              .schedule('any_day', {from: '21:33', to: '23:15'})
              .post
          end
        end

        def test_can_create_sms_campaign_with_text
          test_command 'campaigns', {
            :type => 'sms',
            :name => 'this is the name',
            :description => 'and this is the description',
            :contact_list_ids => [1, 3, 5, 7, 9],
            :from => '12223334444',
            :settings => {
              :text => 'Hello world'
            }
          } do |client|
            client
              .sms_campaign
              .name('this is the name')
              .description('and this is the description')
              .to_contact_lists([1, 3, 5, 7, 9])
              .from('12223334444')
              .text('Hello world')
              .post
          end
        end

        def test_can_create_sms_campaign_with_template
          test_command 'campaigns', {
            :type => 'sms',
            :name => 'this is the name',
            :description => 'and this is the description',
            :contact_list_ids => [1, 3, 5, 7, 9],
            :from => '12223334444',
            :settings => {
              :template_id => 987,
              :variables => { 'key1' => 'value1' }
            }
          } do |client|
            client
              .sms_campaign
              .name('this is the name')
              .description('and this is the description')
              .to_contact_lists([1, 3, 5, 7, 9])
              .from('12223334444')
              .use_template(987, { 'key1' => 'value1' })
              .post
          end
        end

        def test_can_create_sms_campaign_from_sms_service
          test_command 'campaigns', {
            :type => 'sms',
            :name => 'this is the name',
            :description => 'and this is the description',
            :service_id => 55,
            :all_subscribers => true,
            :settings => {
              :template_id => 987,
              :variables => { 'key1' => 'value1' }
            }
          } do |client|
            client
              .sms_campaign
              .name('this is the name')
              .description('and this is the description')
              .from_service(55)
              .all_subscribers
              .use_template(987, { 'key1' => 'value1' })
              .post
          end
        end

        def test_can_delete_a_campaign
          test_command 'campaigns/451' do |client|
            client
              .campaigns
              .id(451)
              .delete
          end
        end

        def test_can_get_all_campaigns
          test_command 'campaigns' do |client|
            client
              .campaigns
              .get
          end
        end

        def test_can_get_a_campaign
          test_command 'campaigns/429' do |client|
            client
              .campaigns
              .id(429)
              .get
          end
        end
      end
    end
  end
end
