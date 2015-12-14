module PortaText
  module Exception
    # Raised on server error, HTTP 500.
    #
    # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
    # Copyright:: Copyright (c) 2015 PortaText
    # License::   Apache-2.0
    class ServerError < RequestError
    end
  end
end
