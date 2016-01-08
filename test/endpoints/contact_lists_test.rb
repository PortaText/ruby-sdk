module PortaText
  module Test
    module Endpoints
      # Tests the contact_lists endpoint.
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class ContactLists < PortaText::Test::Helper::CommandTester
        def test_can_save_contact_list_to_csv
          test_command(
            'contact_lists/33/contacts', '', 'application/json', 'text/csv'
          ) do |client|
            client
              .contact_lists
              .id(33)
              .save_to('/tmp/contact_list.csv')
              .get
          end
        end

        def test_can_create_contact_list
          test_command 'contact_lists', {
            :name => 'this is the name',
            :description => 'and this is the description'
          } do |client|
            client
              .contact_lists
              .name('this is the name')
              .description('and this is the description')
              .post
          end
        end

        def test_can_update_contact_list
          test_command 'contact_lists/763', {
            :name => 'this is the name',
            :description => 'and this is the description'
          } do |client|
            client
              .contact_lists
              .id(763)
              .name('this is the name')
              .description('and this is the description')
              .put
          end
        end

        def test_can_delete_contact_list
          test_command 'contact_lists/763' do |client|
            client
              .contact_lists
              .id(763)
              .delete
          end
        end

        def test_can_upload_csv
          test_command(
            'contact_lists/763/contacts', 'file:/tmp/a.csv', 'text/csv'
          ) do |client|
            client
              .contact_lists
              .id(763)
              .csv('/tmp/a.csv')
              .put
          end
        end
      end
    end
  end
end
