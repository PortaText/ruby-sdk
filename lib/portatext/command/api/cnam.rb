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

        def csv(file)
          set :file, file
        end

        def endpoint(_method)
          error = @args[:number].nil? && @args[:file].nil?
          raise 'DID number cant be null' if error
          number = @args[:number]
          @args.delete :number
          return "cnam/#{number}" unless number.nil?
          'cnam'
        end
      end
    end
  end
end
