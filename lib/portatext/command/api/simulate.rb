module PortaText
  module Command
    module Api
      # The simulate endpoint.
      # https://github.com/PortaText/docs/wiki/REST-API#api_simulate
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Simulate < Base
        def country(country)
          set :country, country
        end

        def use_template(id, variables = {})
          set :template_id, id
          set :variables, variables
        end

        def text(text)
          set :text, text
        end

        # rubocop:disable Metrics/MethodLength
        # rubocop:disable Metrics/AbcSize
        def endpoint(_method)
          raise 'Country cant be null' if @args[:country].nil?
          qs = { 'country' => @args.delete(:country) }
          @args.delete :country
          unless @args[:text].nil?
            qs['text'] = @args[:text]
            @args.delete :text
          end
          unless @args[:template_id].nil?
            qs['template_id'] = @args[:template_id]
            @args.delete :template_id
          end
          unless @args[:variables].nil?
            qs['variables'] = @args[:variables].to_json
            @args.delete :variables
          end
          "simulate?#{URI.encode_www_form qs}"
        end
        # rubocop:enable Metrics/AbcSize
        # rubocop:enable Metrics/MethodLength
      end
    end
  end
end
