module PortaText
  module Command
    module Api
      # The me/credit_cards/:id endpoint.
      # https://github.com/PortaText/docs/wiki/REST-API#api_credit_cards
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class CreditCards < Base
        def id(id)
          set :id, id
        end

        def name_on_card(first, last)
          set :first_name, first
          set :last_name, last
        end

        def card_info(number, expiration_date, code)
          set :card_number, number
          set :card_expiration_date, expiration_date
          set :card_code, code
        end

        def address(street_address, city, state, zip, country)
          set :address, street_address
          set :city, city
          set :state, state
          set :zip, zip
          set :country, country
        end

        def endpoint(_method)
          return 'me/credit_cards' if @args[:id].nil?
          id = @args[:id]
          @args.delete :id
          "me/credit_cards/#{id}"
        end
      end
    end
  end
end
