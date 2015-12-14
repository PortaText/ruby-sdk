module PortaText
  module Test
    module Endpoints
      # Tests the templates endpoint.
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Templates < PortaText::Test::Helper::CommandTester
        def test_can_delete_template
          test_command 'templates/763' do |client|
            client
              .templates
              .id(763)
              .delete
          end
        end

        def test_can_update_template
          test_command 'templates/763', {
            :name => 'a template',
            :text => 'a template text {{and_a_variable}}',
            :description => 'super duper template'
          } do |client|
            client
              .templates
              .id(763)
              .name('a template')
              .text('a template text {{and_a_variable}}')
              .description('super duper template')
              .put
          end
        end

        def test_can_create_template
          test_command 'templates', {
            :name => 'a template',
            :text => 'a template text {{and_a_variable}}',
            :description => 'super duper template'
          } do |client|
            client
              .templates
              .name('a template')
              .text('a template text {{and_a_variable}}')
              .description('super duper template')
              .post
          end
        end

        def test_can_get_all_templates
          test_command 'templates' do |client|
            client
              .templates
              .get
          end
        end

        def test_can_get_a_template
          test_command 'templates/763' do |client|
            client
              .templates
              .id(763)
              .get
          end
        end
      end
    end
  end
end
