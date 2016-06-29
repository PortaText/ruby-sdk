module PortaText
  module Test
    module Endpoints
      # Tests the operators endpoint.
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Operators < PortaText::Test::Helper::CommandTester
        def test_can_paginate_results
          test_command('operators?page=4&sort_by=mcc&order=desc') do |client|
            client
              .operators
              .page(4)
              .sort_by('mcc', 'desc')
              .get
          end
        end
        def test_can_get_all_operators
          test_command('operators') do |client|
            client
              .operators
              .get
          end
        end
      end
    end
  end
end