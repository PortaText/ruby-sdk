module PortaText
  module Command
    module Api
      # The dids/search endpoint.
      # https://github.com/PortaText/docs/wiki/REST-API#api_dids_search
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class DidSearch < Base
        def for_country(iso_code)
          set :country, iso_code
        end

        def toll_free
          type 'toll_free'
        end

        def local
          type 'local'
        end

        def national
          type 'national'
        end

        def mobile
          type 'mobile'
        end

        def page(page)
          set :page, page
        end

        def starts_with(pattern)
          with_pattern 'starts_with', pattern
        end

        def ends_with(pattern)
          with_pattern 'ends_with', pattern
        end

        def contains(pattern)
          with_pattern 'anywhere', pattern
        end

        def body(_method)
          ''
        end

        def endpoint(_method)
          qs = URI.encode_www_form @args
          "dids/search?#{qs}"
        end

        private

        def type(type)
          set :type, type
        end

        def with_pattern(type, pattern)
          set :where_pattern, type
          set :pattern, pattern
        end
      end
    end
  end
end
