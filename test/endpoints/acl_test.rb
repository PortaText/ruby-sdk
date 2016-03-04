module PortaText
  module Test
    module Endpoints
      # Tests the me/acl endpoint.
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Acl < PortaText::Test::Helper::CommandTester
        def test_can_get_acl
          test_command 'acl' do |client|
            client
              .acl
              .get
          end
        end

        def test_put_acl
          test_command 'acl', {
            'acl' => [
              {
                'ip' => '192.168.0.1',
                'netmask' => 32,
                'description' => ''
              },
              {
                'ip' => '10.10.10.10',
                'netmask' => 24,
                'description' => ''
              },
              {
                'ip' => '172.16.0.0',
                'netmask' => 16,
                'description' => 'A description'
              }
            ]
          } do |client|
            client
              .acl
              .add('192.168.0.1')
              .add('10.10.10.10', 24)
              .add('172.16.0.0', 16, 'A description')
              .put
          end
        end
      end
    end
  end
end
