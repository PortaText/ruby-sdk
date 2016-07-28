module PortaText
  module Command
    module Api
      # A Telephony campaign.
      # https://github.com/PortaText/docs/wiki/REST-API#api_campaigns
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class TelCampaign < Campaigns
        def iterations(iterations)
          set_setting :iterations, iterations
        end

        def agents(agents)
          set_setting :agents, agents
        end

        def post_call_work_duration(seconds)
          set_setting :post_call_work_duration, seconds
        end

        def min_iteration_time(minutes)
          set_setting :min_iteration_time, minutes
        end

        def initialize
          super
          set :type, 'telephony'
        end
      end
    end
  end
end
