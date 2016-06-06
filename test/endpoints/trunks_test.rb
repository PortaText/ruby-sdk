module PortaText
  module Test
    module Endpoints
      # Tests the trunks endpoint.
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Trunks < PortaText::Test::Helper::CommandTester
        def test_can_delete_trunk
          test_command 'trunks/763' do |client|
            client
              .trunks
              .id(763)
              .delete
          end
        end

        def test_can_update_trunk
          test_command 'trunks/763', {
            :name => 'a trunk',
            :ip => '1.2.3.4'
          } do |client|
            client
              .trunks
              .id(763)
              .name('a trunk')
              .ip('1.2.3.4')
              .put
          end
        end

        def test_can_create_trunk
          test_command 'trunks', {
            :name => 'a trunk',
            :ip => '1.2.3.4'
          } do |client|
            client
              .trunks
              .name('a trunk')
              .ip('1.2.3.4')
              .post
          end
        end

        def test_can_get_all_trunks
          test_command 'trunks' do |client|
            client
              .trunks
              .get
          end
        end

        def test_can_get_a_trunk
          test_command 'trunks/763' do |client|
            client
              .trunks
              .id(763)
              .get
          end
        end
      end
    end
  end
end
