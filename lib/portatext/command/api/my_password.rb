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
        def change(old_password, new_password)
          set :old_password, old_password
          set :new_password, new_password
        end

        def endpoint(_method)
          'me/password'
        end
      end
    end
  end
end
