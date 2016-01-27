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

        def endpoint(_method)
          return 'sms' if @args[:id].nil?
          id = @args[:id]
          @args.delete :id
          "sms/#{id}"
        end
      end
    end
  end
end
