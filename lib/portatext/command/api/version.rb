module PortaText
  module Command
    module Api
      # The version endpoint.
      # https://github.com/PortaText/docs/wiki/REST-API#api_version
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Version < Base
        def endpoint(_method)
          'version'
        end
      end
    end
  end
end
