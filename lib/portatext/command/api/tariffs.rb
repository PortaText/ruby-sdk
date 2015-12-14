module PortaText
  module Command
    module Api
      # The tariffs endpoint.
      # https://github.com/PortaText/docs/wiki/REST-API#api_tariffs
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Tariffs < Base
        def for_country(country_iso)
          set :country, country_iso
        end

        def endpoint(_method)
          return 'tariffs' if @args[:country].nil?
          country = @args[:country]
          @args.delete :country
          "tariffs/#{country}"
        end
      end
    end
  end
end
