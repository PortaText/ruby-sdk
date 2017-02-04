module PortaText
  module Command
    module Api
      # The calls endpoint.
      # https://github.com/PortaText/docs/wiki/REST-API#api_calls
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Calls < Base
        def to(to)
          set :to, to
        end

        def from(from)
          set :from, from
        end

        def outbound_trunk_id(trunk_id)
          set :outbound_trunk_id, trunk_id
        end

        def dial_timeout(timeout)
          set :dial_timeout, timeout
        end

        def flow(call_flow)
          set :flow, call_flow
        end

        def endpoint(_method)
          'calls'
        end
      end
    end
  end
end
