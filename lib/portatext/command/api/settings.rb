module PortaText
  module Command
    module Api
      # The me/settings endpoint.
      # https://github.com/PortaText/docs/wiki/REST-API#api_settings
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

        def enable_autorecharges(when_credit, total)
          set :autorecharge_enabled, true
          set :autorecharge_total, total
          set :autorecharge_when_credit, when_credit
        end

        def disable_autorecharges
          set :autorecharge_enabled, false
        end

        def default_credit_card(card_id)
          set :default_card_id, card_id
        end

        def amd_max_word_length(value)
          set :amd_max_word_length, value
        end

        def amd_silence_threshold(value)
          set :amd_silence_threshold, value
        end

        def amd_max_words(value)
          set :amd_max_words, value
        end

        def amd_between_words_silence(value)
          set :amd_between_words_silence, value
        end

        def amd_min_word_length(value)
          set :amd_min_word_length, value
        end

        def amd_total_time(value)
          set :amd_total_time, value
        end

        def amd_after_greeting_silence(value)
          set :amd_after_greeting_silence, value
        end

        def amd_max_greeting_length(value)
          set :amd_max_greeting_length, value
        end

        def amd_initial_silence(value)
          set :amd_initial_silence, value
        end

        def endpoint(_method)
          'me/settings'
        end
      end
    end
  end
end
