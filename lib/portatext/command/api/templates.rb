module PortaText
  module Command
    module Api
      # The templates endpoint.
      # https://github.com/PortaText/docs/wiki/REST-API#api_templates
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Templates < Base
        def id(id)
          set :id, id
        end

        def name(name)
          set :name, name
        end

        def description(description)
          set :description, description
        end

        def text(text)
          set :text, text
        end

        def endpoint(_method)
          return 'templates' if @args[:id].nil?
          id = @args[:id]
          @args.delete :id
          "templates/#{id}"
        end
      end
    end
  end
end
