module PortaText
  module Command
    module Api
      # The me/password endpoint.
      # https://github.com/PortaText/docs/wiki/REST-API#api_me_password
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class MyPassword < Base
        def reset
          set :reset, true
        end

        def for_email(email)
          set :email, email
        end

        def with_nonce(nonce, new_password)
          set :nonce, nonce
          set :new_password, new_password
        end

        def change(old_password, new_password)
          set :old_password, old_password
          set :new_password, new_password
        end

        def endpoint(_method)
          return 'me/password' if @args[:reset].nil?
          @args.delete :reset
          return 'me/password/reset' if @args[:nonce].nil?
          nonce = @args[:nonce]
          @args.delete :nonce
          "me/password/reset/#{nonce}"
        end
      end
    end
  end
end
