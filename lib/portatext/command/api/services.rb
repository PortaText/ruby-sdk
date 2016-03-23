module PortaText
  module Command
    module Api
      # The sms_services endpoint.
      # https://github.com/PortaText/docs/wiki/REST-API#api_sms_services
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Services < Base
        def id(id)
          set :id, id
        end

        def save_to(file)
          set :accept_file, file
        end

        def page(page)
          set :page, page
        end

        def endpoint(_method)
          base = 'sms_services'
          return base if @args[:id].nil?
          id = @args[:id]
          @args.delete :id
          page = @args[:page]
          @args.delete :page
          return "#{base}/#{id}/subscribers" unless @args[:accept_file].nil?
          return "#{base}/#{id}/subscribers?page=#{page}" unless page.nil?
          "#{base}/#{id}"
        end
      end
    end
  end
end
