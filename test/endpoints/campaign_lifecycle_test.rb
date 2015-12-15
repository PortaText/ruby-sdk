module PortaText
  module Test
    module Endpoints
      # Tests the campaigns/:id/lifecycle endpoint.
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class CampaignLifecycle < PortaText::Test::Helper::CommandTester
        def test_cannot_act_on_null_campaign
          assert_raises RuntimeError do
            test_command do |client|
              client
                .campaign_lifecycle
                .start
                .post
            end
          end
        end

        def test_can_start_campaign
          test_command 'campaigns/391/lifecycle', {
            :action => 'start'
          } do |client|
            client
              .campaign_lifecycle
              .id(391)
              .start
              .post
          end
        end

        def test_can_pause_campaign
          test_command 'campaigns/391/lifecycle', {
            :action => 'pause'
          } do |client|
            client
              .campaign_lifecycle
              .id(391)
              .pause
              .post
          end
        end

        def test_can_resume_campaign
          test_command 'campaigns/391/lifecycle', {
            :action => 'resume'
          } do |client|
            client
              .campaign_lifecycle
              .id(391)
              .resume
              .post
          end
        end

        def test_can_cancel_campaign
          test_command 'campaigns/391/lifecycle', {
            :action => 'cancel'
          } do |client|
            client
              .campaign_lifecycle
              .id(391)
              .cancel
              .post
          end
        end
      end
    end
  end
end
