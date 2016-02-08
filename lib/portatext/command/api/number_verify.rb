module PortaText
  module Command
    module Api
      # The number verify endpoint.
      # https://github.com/PortaText/docs/wiki/REST-API#api_number_verify
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class NumberVerify < Base
        def for_number(number)
          set :number, number
        end

        def from(from)
          set :from, from
        end

        def verify_with(code)
          set :code, code
        end

        def use_template(id, variables = {})
          set :template_id, id
          set :variables, variables
        end

        def endpoint(_method)
          raise 'DID number cant be null' if @args[:number].nil?
          number = @args[:number]
          @args.delete :number
          return "number_verify/#{number}" if @args[:code].nil?
          code = @args[:code]
          @args.delete :code
          "number_verify/#{number}?code=#{code}"
        end
      end
    end
  end
end
