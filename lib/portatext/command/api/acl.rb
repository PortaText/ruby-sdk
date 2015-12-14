module PortaText
  module Command
    module Api
      # The me/acl endpoint.
      # https://github.com/PortaText/docs/wiki/REST-API#api_acl
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Me < Base
        def name(first, last)
          @args[:first_name] = first
          @args[:last_name] = last
          self
        end

        def company(company)
          @args[:company] = company
          self
        end

        def email(email)
          @args[:email] = email
          self
        end

        def callback_url(callback_url)
          @args[:callback_url] = callback_url
          self
        end

        def timezone(timezone)
          @args[:timezone] = timezone
          self
        end

        def endpoint(_method)
          'me'
        end
      end
    end
  end
end
