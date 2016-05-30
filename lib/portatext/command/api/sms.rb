module PortaText
  module Command
    module Api
      # The sms endpoint.
      # https://github.com/PortaText/docs/wiki/REST-API#api_sms
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Sms < Base
        def id(id)
          set :id, id
        end

        def to(to)
          set :to, to
        end

        def from(from)
          set :from, from
        end

        def from_service(service_id)
          set :service_id, service_id
        end

        def use_template(id, variables = {})
          set :template_id, id
          set :variables, variables
        end

        def text(text)
          set :text, text
        end

        def client_ref(client_ref)
          set :client_ref, client_ref
        end

        def to_contact_lists(contact_lists)
          set :contact_list_ids, contact_lists
        end

        def search(params)
          set :search_params, params
        end

        def endpoint(_method)
          unless @args[:search_params].nil?
            qs = URI.encode_www_form @args[:search_params]
            @args.delete :search_params
            return "sms?#{qs}"
          end

          return 'sms' if @args[:id].nil?
          id = @args[:id]
          @args.delete :id
          "sms/#{id}"
        end
      end
    end
  end
end
