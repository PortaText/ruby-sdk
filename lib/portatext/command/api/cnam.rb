module PortaText
  module Command
    module Api
      # The cnam endpoint.
      # https://github.com/PortaText/docs/wiki/REST-API#api_cnam
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Cnam < Base
        def for_number(number)
          set :number, number
        end

        def endpoint(_method)
          raise 'DID number cant be null' if @args[:number].nil?
          number = @args[:number]
          @args.delete :number
          "cnam/#{number}"
        end
      end
    end
  end
end
