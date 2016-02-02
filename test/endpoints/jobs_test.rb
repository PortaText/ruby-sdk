module PortaText
  module Test
    module Endpoints
      # Tests the jobs endpoint.
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Me < PortaText::Test::Helper::CommandTester
        def test_can_get_all_jobs_paginated
          test_command 'jobs?page=55' do |client|
            client
              .jobs
              .page(55)
              .get
          end
        end

        def test_can_get_all_jobs
          test_command 'jobs' do |client|
            client
              .jobs
              .get
          end
        end

        def test_can_get_one_job
          test_command 'jobs/987' do |client|
            client
              .jobs
              .id(987)
              .get
          end
        end

        def test_can_cancel_job
          test_command 'jobs/987' do |client|
            client
              .jobs
              .id(987)
              .delete
          end
        end
      end
    end
  end
end
