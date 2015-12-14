module PortaText
  module Exception
    # Raised when credentials were invalid HTTP 401.
    #
    # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
    # Copyright:: Copyright (c) 2015 PortaText
    # License::   Apache-2.0
    class InvalidCredentials < RequestError
    end
  end
end
