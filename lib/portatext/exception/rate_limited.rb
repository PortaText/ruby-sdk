module PortaText
  module Exception
    # Raised on rate limited by the server, HTTP 429.
    #
    # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
    # Copyright:: Copyright (c) 2015 PortaText
    # License::   Apache-2.0
    class RateLimited < RequestError
    end
  end
end
