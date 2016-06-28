module PortaText
  module Command
    module Api
      # The inspect endpoint.
      # https://github.com/PortaText/docs/wiki/REST-API#api_inspect
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class NumberInspect < Base
        def number(number)
          set :number, number
        end

        def csv(file)
          set :file, file
        end

        def endpoint(_method)
          number = @args[:number]
          @args.delete :number
          return "inspect/#{number}" unless number.nil?
          'inspect'
        end
      end
    end
  end
end
