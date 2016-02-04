module PortaText
  module Command
    module Api
      # The contact_lists endpoint.
      # https://github.com/PortaText/docs/wiki/REST-API#api_contact_lists
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class ContactLists < Base
        def id(id)
          set :id, id
        end

        def name(name)
          set :name, name
        end

        def description(description)
          set :description, description
        end

        def csv(file)
          set :file, file
        end

        def save_to(file)
          set :accept_file, file
        end

        def with_number(number)
          set :number, number
        end

        def page(page)
          set :page, page
        end

        # rubocop:disable Metrics/MethodLength
        # rubocop:disable Metrics/AbcSize
        def endpoint(_method)
          return 'contact_lists' if @args[:id].nil?
          id = @args[:id]
          @args.delete :id
          number = @args[:number]
          @args.delete :number
          page = @args[:page]
          @args.delete :page
          return "contact_lists/#{id}/contacts/#{number}" unless number.nil?
          return "contact_lists/#{id}/contacts" unless @args[:file].nil?
          return "contact_lists/#{id}/contacts" unless @args[:accept_file].nil?
          return "contact_lists/#{id}/contacts?page=#{page}" unless page.nil?
          "contact_lists/#{id}"
        end
        # rubocop:enable Metrics/AbcSize
        # rubocop:enable Metrics/MethodLength
      end
    end
  end
end
