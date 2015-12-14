module PortaText
  module Command
    module Api
      # The me/email_verify endpoint.
      # https://github.com/PortaText/docs/wiki/REST-API#api_email_verify
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class EmailVerify < Base
        def with_nonce(nonce)
          set :nonce, nonce
        end

        def endpoint(_method)
          return 'me/email_verify' if @args[:nonce].nil?
          nonce = @args[:nonce]
          @args.delete :nonce
          "me/email_verify/#{nonce}"
        end
      end
    end
  end
end
