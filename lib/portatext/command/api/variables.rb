module PortaText
  module Command
    module Api
      # The variables endpoint.
      # https://github.com/PortaText/docs/wiki/REST-API#api_variables
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Variables < Base
        def for_contact(number)
          set :number, number
        end

        def name(name)
          set :name, name
        end

        def set_to(name, value)
          self.name name
          set :value, value
        end

        # rubocop:disable Style/AccessorMethodName
        def set_all(variables)
          variables = variables.reduce([]) do |acc, v|
            acc << { key: v[0], value: v[1] }
          end
          set :variables, variables
        end
        # rubocop:enable Style/AccessorMethodName

        def endpoint(_method)
          number = @args[:number]
          @args.delete :number
          return "contacts/#{number}/variables" if @args[:name].nil?
          name = @args[:name]
          @args.delete :name
          "contacts/#{number}/variables/#{name}"
        end
      end
    end
  end
end
