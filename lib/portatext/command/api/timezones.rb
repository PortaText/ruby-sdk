module PortaText
  module Command
    module Api
      # The timezones endpoint.
      # https://github.com/PortaText/docs/wiki/REST-API#api_timezones
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Timezones < Base
        def endpoint(_method)
          'timezones'
        end
      end
    end
  end
end
