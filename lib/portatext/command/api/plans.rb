module PortaText
  module Command
    module Api
      # The plans endpoint.
      # https://github.com/PortaText/docs/wiki/REST-API#api_plans
      #
      # Author::    Laura Corvalan (mailto:laura@portatext.com)
      # Copyright:: Copyright (c) 2015- PortaText
      # License::   Apache-2.0
      class Plans < Base
        def endpoint(_method)
          'plans'
        end
      end
    end
  end
end
