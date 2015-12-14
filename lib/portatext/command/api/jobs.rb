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

        def endpoint(_method)
          return 'jobs' if @args[:id].nil?
          id = @args[:id]
          @args.delete :id
          "jobs/#{id}"
        end
      end
    end
  end
end
