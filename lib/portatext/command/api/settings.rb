module PortaText
  module Command
    module Api
      # The me/settings endpoint.
      # https://github.com/PortaText/docs/wiki/REST-API#api_me
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Settings < Base
        def dont_alert_on_low_credit
          set :alert_when_credit_less_than, nil
        end

        def alert_when_credit_less_than(total)
          set :alert_when_credit_less_than, total
        end

        def dont_send_inbound_by_email
          set :email_on_inbound_sms, nil
        end

        def send_inbound_by_email(email)
          set :email_on_inbound_sms, email
        end

        def enable_autorecharges(when_credit, card_id, plan_id, total)
          set :autorecharge_enabled, true
          set :autorecharge_plan_id, plan_id
          set :autorecharge_card_id, card_id
          set :autorecharge_total, total
          set :autorecharge_when_credit, when_credit
        end

        def disable_autorecharges
          set :autorecharge_enabled, false
        end

        def endpoint(_method)
          'me/settings'
        end
      end
    end
  end
end
