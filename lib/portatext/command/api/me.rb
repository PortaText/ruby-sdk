module PortaText
  module Command
    module Api
      # The me endpoint.
      # https://github.com/PortaText/docs/wiki/REST-API#api_me
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Me < Base
        def name(first, last)
          set :first_name, first
          set :last_name, last
        end

        def company(company)
          set :company, company
        end

        def email(email)
          set :email, email
        end

        def callback_url(callback_url)
          set :callback_url, callback_url
        end

        def timezone(timezone)
          set :timezone, timezone
        end

        def language(language)
          set :language, language
        end

        def endpoint(_method)
          'me'
        end
      end
    end
  end
end
