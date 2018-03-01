module PortaText
  module Command
    module Api
      # The contacts endpoint.
      # https://github.com/PortaText/docs/wiki/REST-API#api_all_contacts
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Contacts < Base
        def id(number)
          set :number, number
        end

        def with_contact_lists
          set :with_contact_lists, true
        end

        def page(page)
          set :page, page
        end

        def name(name)
          set :name, name
        end

        def set_to(name, value)
          self.name name
          set :value, value
        end

        def csv(file)
          set :file, file
        end

        def save_to(file)
          set :accept_file, file
        end

        # rubocop:disable Naming/AccessorMethodName
        def set_all(variables)
          variables = variables.reduce([]) do |acc, v|
            acc << { key: v[0], value: v[1] }
          end
          set :variables, variables
        end
        # rubocop:enable Naming/AccessorMethodName

        # rubocop:disable Metrics/MethodLength
        # rubocop:disable Metrics/AbcSize
        def endpoint(_method)
          qs = {}
          unless @args[:page].nil?
            qs['page'] = @args[:page]
            @args.delete :page
          end
          unless @args[:with_contact_lists].nil?
            qs['with_contact_lists'] = 'true'
            @args.delete :with_contact_lists
          end
          qs = URI.encode_www_form qs
          return "contacts?#{qs}" if @args[:number].nil?
          number = @args[:number]
          @args.delete :number
          return "contacts/#{number}/variables" if @args[:name].nil?
          name = @args[:name]
          @args.delete :name
          "contacts/#{number}/variables/#{name}"
        end
        # rubocop:enable Metrics/MethodLength
        # rubocop:enable Metrics/AbcSize
      end
    end
  end
end
