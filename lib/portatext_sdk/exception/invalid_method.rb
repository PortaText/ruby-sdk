module PortaText
  module Exception
    # Raised on invalid endpoint/method combination HTTP 405.
    #
    # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
    # Copyright:: Copyright (c) 2015 PortaText
    # License::   Apache-2.0
    class InvalidMethod < RequestError
    end
  end
end
