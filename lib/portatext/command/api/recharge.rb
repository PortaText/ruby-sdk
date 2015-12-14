module PortaText
  module Command
    module Api
      # The recharge endpoint.
      # https://github.com/PortaText/docs/wiki/REST-API#api_recharge
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Recharge < Base
        def with_card(card_id)
          set :card_id, card_id
        end

        def total(plan_id, total)
          set :plan_id, plan_id
          set :total, total
        end

        def endpoint(_method)
          'recharge'
        end
      end
    end
  end
end
