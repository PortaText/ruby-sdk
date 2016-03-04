module PortaText
  module Command
    module Api
      # The acl endpoint.
      # https://github.com/PortaText/docs/wiki/REST-API#api_acl
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Acl < Base
        def add(ip, netmask = 32, description = '')
          key = "#{ip}#{netmask}"
          set key, ip: ip, netmask: netmask, description: description
        end

        def body(method)
          return super if method.eql? :get
          { acl: @args.values }.to_json
        end

        def endpoint(_method)
          'acl'
        end
      end
    end
  end
end
