module PortaText
  module Command
    module Api
      # The summary endpoint.
      # https://github.com/PortaText/docs/wiki/REST-API#api_summary
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Summary < Base
        def to(date)
          set :date_to, date
        end

        def from(date)
          set :date_from, date
        end

        def save_to(file)
          set :accept_file, file
        end

        def by_day
          set :granularity, 'date'
        end

        def by_month
          set :granularity, 'month'
        end

        def by_week
          set :granularity, 'week'
        end

        # rubocop:disable Metrics/MethodLength
        # rubocop:disable Metrics/AbcSize
        def endpoint(_method)
          qs = {}
          unless @args[:date_from].nil?
            qs[:date_from] = @args[:date_from]
            @args.delete :date_from
          end
          unless @args[:date_to].nil?
            qs[:date_to] = @args[:date_to]
            @args.delete :date_to
          end
          unless @args[:granularity].nil?
            qs[:granularity] = @args[:granularity]
            @args.delete :granularity
          end
          unless qs.empty?
            qs = URI.encode_www_form qs
            return "summary?#{qs}"
          end

          'summary'
        end
        # rubocop:enable Metrics/AbcSize
        # rubocop:enable Metrics/MethodLength
      end
    end
  end
end
