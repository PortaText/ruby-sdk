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

        def endpoint(_method)
          return 'contact_lists' if @args[:id].nil?
          id = @args[:id]
          @args.delete :id
          return "contact_lists/#{id}/contacts" unless @args[:file].nil?
          "contact_lists/#{id}"
        end
      end
    end
  end
end
