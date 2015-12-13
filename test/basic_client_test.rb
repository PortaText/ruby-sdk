require 'test_helper'

module PortaText
  module Test
    # Tests the base client mplementation.
    #
    # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
    # Copyright:: Copyright (c) 2015 PortaText
    # License::   Apache-2.0
    class BaseClient < Minitest::Test
      def test_execute_method_is_abstract
        client = AbstractClient.new
        begin
          client.execute PortaText::Command::Descriptor.new(
            "http://localhost:1111",
            :get,
            {},
            "body"
          )
        rescue RuntimeError => e
          assert e.message == "You must implement this"
        end
      end
    end

    class AbstractClient < PortaText::Client::BaseClient
    end
  end
end
