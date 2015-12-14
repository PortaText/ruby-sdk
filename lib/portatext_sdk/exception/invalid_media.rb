module PortaText
  module Exception
    # Raised on invalid content type for endpoint/method combination HTTP 415.
    #
    # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
    # Copyright:: Copyright (c) 2015 PortaText
    # License::   Apache-2.0
    class InvalidMedia < RequestError
    end
  end
end
