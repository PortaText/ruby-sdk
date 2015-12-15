module PortaText
  module Command
    module Api
      # The blacklist endpoint.
      # https://github.com/PortaText/docs/wiki/REST-API#api_blacklist
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Blacklist < Base
        def number(number)
          set :number, number
        end

        def csv(file)
          set :file, file
        end

        def endpoint(_method)
          return 'blacklist/contacts' unless @args[:file].nil?
          return 'blacklist' if @args[:number].nil?
          number = @args[:number]
          @args.delete :number
          "blacklist/#{number}"
        end
      end
    end
  end
end
