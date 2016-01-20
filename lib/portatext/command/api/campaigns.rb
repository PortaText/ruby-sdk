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

        # rubocop:disable Metrics/MethodLength
        def endpoint(_method)
          unless @args[:file].nil?
            settings = @args.clone
            settings.delete :file
            settings = settings.to_json
            settings = URI.encode_www_form('settings' => settings)
            return "campaigns?#{settings}"
          end
          return 'campaigns' if @args[:id].nil?
          id = @args[:id]
          @args.delete :type
          @args.delete :id
          "campaigns/#{id}"
        end
        # rubocop:enable Metrics/MethodLength
      end
    end
  end
end
