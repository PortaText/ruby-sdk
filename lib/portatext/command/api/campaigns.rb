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

        def contact(contact)
          set :contact, contact
        end

        def schedule(type, details)
          schedule = {}
          schedule[type] = details
          set :schedule, schedule
        end

        def set_setting(name, value)
          args = @args[:settings]
          args ||= {}
          args[name] = value
          set :settings, args
        end

        # rubocop:disable Metrics/MethodLength
        # rubocop:disable Metrics/AbcSize
        # rubocop:disable Metrics/CyclomaticComplexity
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
            contact = @args[:contact]
            @args.delete :type
            @args.delete :id
            @args.delete :contacts
            @args.delete :contact
            return "campaigns/#{id}/contacts/#{contact}" if contact
            return "campaigns/#{id}/contacts?#{qs}" if contacts
            return "campaigns/#{id}"
          end
          return "campaigns?#{qs}" unless qs.empty?
          'campaigns'
        end
        # rubocop:enable Metrics/CyclomaticComplexity
        # rubocop:enable Metrics/AbcSize
        # rubocop:enable Metrics/MethodLength
      end
    end
  end
end
