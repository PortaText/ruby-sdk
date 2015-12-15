module PortaText
  module Test
    module Endpoints
      # Tests the dids/search endpoint.
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class DidSearch < PortaText::Test::Helper::CommandTester
        def test_can_search_for_local_numbers
          test_command 'dids/search?country=JP&type=local' do |client|
            client
              .did_search
              .for_country("JP")
              .local
              .get
          end
        end

        def test_can_search_for_mobile_numbers
          test_command 'dids/search?country=JP&type=mobile' do |client|
            client
              .did_search
              .for_country("JP")
              .mobile
              .get
          end
        end

        def test_can_search_for_toll_free_numbers
          test_command 'dids/search?country=JP&type=toll_free' do |client|
            client
              .did_search
              .for_country("JP")
              .toll_free
              .get
          end
        end

        def test_can_search_for_national_numbers
          test_command 'dids/search?country=JP&type=national' do |client|
            client
              .did_search
              .for_country("JP")
              .national
              .get
          end
        end

        def test_can_search_for_numbers_starting_with
          args = [
            'country=US',
            'where_pattern=starts_with',
            'pattern=305'
          ].join '&'
          test_command "dids/search?#{args}" do |client|
            client
              .did_search
              .for_country("US")
              .starts_with('305')
              .get
          end
        end

        def test_can_search_for_numbers_ending_with
          args = [
            'country=US',
            'where_pattern=ends_with',
            'pattern=999'
          ].join '&'
          test_command "dids/search?#{args}" do |client|
            client
              .did_search
              .for_country("US")
              .ends_with('999')
              .get
          end
        end

        def test_can_search_for_numbers_containing_pattern
          args = [
            'country=US',
            'where_pattern=anywhere',
            'pattern=444'
          ].join '&'
          test_command "dids/search?#{args}" do |client|
            client
              .did_search
              .for_country("US")
              .contains('444')
              .get
          end
        end

        def test_can_paginate_search
          args = [
            'country=US',
            'page=3'
          ].join '&'
          test_command "dids/search?#{args}" do |client|
            client
              .did_search
              .for_country("US")
              .page(3)
              .get
          end
        end
      end
    end
  end
end
