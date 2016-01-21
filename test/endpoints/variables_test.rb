module PortaText
  module Test
    module Endpoints
      # Tests the variables endpoint.
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Variables < PortaText::Test::Helper::CommandTester
        def test_can_delete_all_variables
          test_command 'contacts/12223334444/variables' do |client|
            client
              .variables
              .for_contact('12223334444')
              .delete
          end
        end

        def test_can_delete_one_variable
          test_command 'contacts/12223334444/variables/first_name' do |client|
            client
              .variables
              .for_contact('12223334444')
              .name('first_name')
              .delete
          end
        end

        def test_can_get_all_variables
          test_command 'contacts/12223334444/variables' do |client|
            client
              .variables
              .for_contact('12223334444')
              .get
          end
        end

        def test_can_get_one_variable
          test_command 'contacts/12223334444/variables/first_name' do |client|
            client
              .variables
              .for_contact('12223334444')
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
              .variables
              .for_contact('12223334444')
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
              .variables
              .for_contact('12223334444')
              .set_to('first_name', 'John')
              .put
          end
        end
      end
    end
  end
end
