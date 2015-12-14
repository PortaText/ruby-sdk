module PortaText
  module Exception
    # Raised when the request issued was invalid, HTTP 400.
    #
    # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
    # Copyright:: Copyright (c) 2015 PortaText
    # License::   Apache-2.0
    class ClientError < RequestError
    end
  end
end
