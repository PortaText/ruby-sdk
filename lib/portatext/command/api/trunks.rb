module PortaText
  module Command
    module Api
      # The trunks endpoint.
      # https://github.com/PortaText/docs/wiki/REST-API#api_trunks
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Trunks < Base
        def id(id)
          set :id, id
        end

        def name(name)
          set :name, name
        end

        def ip(ip)
          set :ip, ip
        end

        def endpoint(_method)
          return 'trunks' if @args[:id].nil?
          id = @args[:id]
          @args.delete :id
          "trunks/#{id}"
        end
      end
    end
  end
end
