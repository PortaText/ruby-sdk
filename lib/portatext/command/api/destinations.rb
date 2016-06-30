module PortaText
  module Command
    module Api
      # The destinations endpoint.
      # https://github.com/PortaText/docs/wiki/REST-API#api_destinations
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Destinations < Base
        def page(page)
          set :page, page
        end

        def sort_by(sort_by, order)
          set :sort_by, sort_by
          set :order, order
        end

        def save_to(file)
          set :accept_file, file
        end

        # rubocop:disable Metrics/MethodLength
        # rubocop:disable Metrics/AbcSize
        def endpoint(_method)
          qs = {}
          unless @args[:page].nil?
            qs['page'] = @args[:page]
            @args.delete :page
          end
          unless @args[:sort_by].nil?
            qs['sort_by'] = @args[:sort_by]
            @args.delete :sort_by
          end
          unless @args[:order].nil?
            qs['order'] = @args[:order]
            @args.delete :order
          end

          return "destinations?#{URI.encode_www_form qs}" unless qs.empty?
          'destinations'
        end
        # rubocop:enable Metrics/AbcSize
        # rubocop:enable Metrics/MethodLength
      end
    end
  end
end
