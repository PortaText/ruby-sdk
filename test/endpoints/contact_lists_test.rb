module PortaText
  module Test
    module Endpoints
      # Tests the contact_lists endpoint.
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class ContactLists < PortaText::Test::Helper::CommandTester
        def test_can_paginate_contacts
          test_command('contact_lists/33/contacts?page=55') do |client|
            client
              .contact_lists
              .id(33)
              .page(55)
              .get
          end
        end

        def test_can_add_number_to_contact_list
          test_command(
            'contact_lists/33/contacts/12223334444'
          ) do |client|
            client
              .contact_lists
              .id(33)
              .with_number('12223334444')
              .put
          end
        end

        def test_can_add_number_to_contact_list_with_variables
          test_command(
            'contact_lists/33/contacts/12223334444', {
            :variables => [
              {:key => 'first_name', :value => 'John'},
              {:key => 'last_name', :value => 'Doe'}
            ]
          }) do |client|
            client
              .contact_lists
              .id(33)
              .with_number('12223334444', {
                :first_name => 'John',
                :last_name => 'Doe'
              }).put
          end
        end

        def test_can_delete_number_from_contact_list
          test_command(
            'contact_lists/33/contacts/12223334444'
          ) do |client|
            client
              .contact_lists
              .id(33)
              .with_number('12223334444')
              .delete
          end
        end

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
