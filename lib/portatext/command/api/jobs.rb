module PortaText
  module Command
    module Api
      # The jobs endpoint.
      # https://github.com/PortaText/docs/wiki/REST-API#api_jobs
      #
      # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
      # Copyright:: Copyright (c) 2015 PortaText
      # License::   Apache-2.0
      class Jobs < Base
        def id(id)
          set :id, id
        end

        def page(page)
          set :page, page
        end

        def endpoint(_method)
          page = @args[:page]
          @args.delete :page
          endpoint = 'jobs'
          endpoint = "jobs?page=#{page}" unless page.nil?
          return endpoint if @args[:id].nil?
          id = @args[:id]
          @args.delete :id
          "jobs/#{id}"
        end
      end
    end
  end
end
