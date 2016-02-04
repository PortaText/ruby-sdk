module PortaText
  module Command
    module Api
      # The campaigns/:id/lifecycle endpoint.
      # https://github.com/PortaText/docs/wiki/REST-API#api_campaigns_lifecycle
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class CampaignLifecycle < Base
        def id(id)
          set :id, id
        end

        def start
          action 'start'
        end

        def pause
          action 'pause'
        end

        def resume
          action 'resume'
        end

        def cancel
          action 'cancel'
        end

        def endpoint(_method)
          raise 'Campaign id cant be null' if @args[:id].nil?
          id = @args[:id]
          @args.delete :id
          "campaigns/#{id}/lifecycle"
        end

        private

        def action(action)
          set :action, action
        end
      end
    end
  end
end
