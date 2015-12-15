module PortaText
  module Command
    module Api
      # An SMS campaign.
      # https://github.com/PortaText/docs/wiki/REST-API#api_campaigns
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class SmsCampaign < Campaigns
        def use_template(template_id, variables)
          set :template_id, template_id
          set :variables, variables
        end

        def text(text)
          set :text, text
        end

        def initialize
          super
          set :type, 'sms'
        end
      end
    end
  end
end
