module PortaText
  module Command
    module Api
      # The gsm_charset endpoint.
      # https://github.com/PortaText/docs/wiki/REST-API#api_gsm_charset
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class GsmCharset < Base
        def endpoint(_method)
          'gsm_charset'
        end
      end
    end
  end
end
