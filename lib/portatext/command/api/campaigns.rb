module PortaText
  module Command
    module Api
      # The campaigns endpoint.
      # https://github.com/PortaText/docs/wiki/REST-API#api_campaigns
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Campaigns < Base
        def id(id)
          set :id, id
        end

        def name(name)
          set :name, name
        end

        def description(description)
          set :description, description
        end

        def from(from)
          set :from, from
        end

        def to_contact_lists(contact_lists)
          set :contact_list_ids, contact_lists
        end

        def csv(file)
          set :file, file
        end

        def use_template(template_id, variables)
          set :settings, template_id: template_id, variables: variables
        end

        def text(text)
          set :settings, text: text
        end

        def from_service(service_id)
          set :service_id, service_id
        end

        def all_subscribers
          set :all_subscribers, true
        end

        def page(page)
          set :page, page
        end

        def save_to(file)
          set :accept_file, file
        end

        def contacts
          set :contacts, true
        end

        # rubocop:disable Metrics/MethodLength
        # rubocop:disable Metrics/AbcSize
        def endpoint(_method)
          unless @args[:file].nil?
            settings = @args.clone
            settings.delete :file
            settings = settings.to_json
            settings = URI.encode_www_form('settings' => settings)
            return "campaigns?#{settings}"
          end
          qs = {}
          unless @args[:page].nil?
            qs['page'] = @args[:page]
            @args.delete :page
          end
          qs = URI.encode_www_form qs
          unless @args[:id].nil?
            id = @args[:id]
            contacts = @args[:contacts]
            @args.delete :type
            @args.delete :id
            @args.delete :contacts
            return "campaigns/#{id}/contacts?#{qs}" if contacts
            return "campaigns/#{id}"
          end
          return "campaigns?#{qs}" unless qs.empty?
          'campaigns'
        end
        # rubocop:enable Metrics/AbcSize
        # rubocop:enable Metrics/MethodLength
      end
    end
  end
end
