module PortaText
  module Command
    module Api
      # The sounds endpoint.
      # https://github.com/PortaText/docs/wiki/REST-API#api_sounds
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Sounds < Base
        def id(id)
          set :id, id
        end

        def name(name)
          set :name, name
        end

        def description(description)
          set :description, description
        end

        def save_to(file)
          set :accept_sound_file, file
        end

        def sound(file)
          set :sound_file, file
        end

        def body(_method)
          return "file:#{@args[:sound_file]}" unless @args[:sound_file].nil?
          super
        end

        # rubocop:disable Metrics/MethodLength
        # rubocop:disable Metrics/AbcSize
        def endpoint(_method)
          endpoint = 'sounds'
          id = @args[:id]
          @args.delete :id

          endpoint = "#{endpoint}/#{id}" unless id.nil?

          qs = {}
          unless @args[:description].nil?
            qs['description'] = @args[:description]
            @args.delete :description
          end

          unless @args[:name].nil?
            qs['name'] = @args[:name]
            @args.delete :name
          end

          unless qs.empty?
            qs = URI.encode_www_form qs
            return "#{endpoint}?#{qs}"
          end
          endpoint
        end
        # rubocop:enable Metrics/AbcSize
        # rubocop:enable Metrics/MethodLength
      end
    end
  end
end
