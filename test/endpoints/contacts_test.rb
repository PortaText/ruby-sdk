module PortaText
  module Test
    module Endpoints
      # Tests the contacts endpoint.
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Contacts < PortaText::Test::Helper::CommandTester
        def test_can_delete_all_variables
          test_command 'contacts/12223334444/variables' do |client|
            client
              .contacts
              .id('12223334444')
              .delete
          end
        end

        def test_can_delete_one_variable
          test_command 'contacts/12223334444/variables/first_name' do |client|
            client
              .contacts
              .id('12223334444')
              .name('first_name')
              .delete
          end
        end

        def test_can_get_all_variables
          test_command 'contacts/12223334444/variables' do |client|
            client
              .contacts
              .id('12223334444')
              .get
          end
        end

        def test_can_get_one_variable
          test_command 'contacts/12223334444/variables/first_name' do |client|
            client
              .contacts
              .id('12223334444')
              .name('first_name')
              .get
          end
        end

        def test_can_put_all_variables
          test_command 'contacts/12223334444/variables', {
            :variables => [
              {:key => 'first_name', :value => 'John'},
              {:key => 'last_name', :value => 'Doe'}
            ]
          } do |client|
            client
              .contacts
              .id('12223334444')
              .set_all({
                :first_name => 'John',
                :last_name => 'Doe'
              })
              .put
          end
        end

        def test_can_put_one_variable
          test_command 'contacts/12223334444/variables/first_name', {
            :value => 'John'
          } do |client|
            client
              .contacts
              .id('12223334444')
              .set_to('first_name', 'John')
              .put
          end
        end

        def test_can_export_all_variables_to_csv
          test_command(
            'contacts?', '', 'application/json', 'text/csv'
          ) do |client|
            client
              .contacts
              .save_to('/tmp/contacts.csv')
              .get
          end
        end

        def test_can_export_all_variables_to_csv_with_contact_lists
          test_command(
            'contacts?with_contact_lists=true', '', 'application/json', 'text/csv'
          ) do |client|
            client
              .contacts
              .with_contact_lists
              .save_to('/tmp/contacts.csv')
              .get
          end
        end

        def test_can_import_all_variables_from_csv
          test_command(
            'contacts?',
            'file:/tmp/contacts.csv',
            'text/csv',
            'application/json'
          ) do |client|
            client
              .contacts
              .csv('/tmp/contacts.csv')
              .put
          end
        end

        def test_can_paginate_contacts
          test_command('contacts?page=44') do |client|
            client
              .contacts
              .page(44)
              .get
          end
        end
      end
    end
  end
end
