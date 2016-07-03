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

        def endpoint(_method)
          'simulate'
        end
      end
    end
  end
end
