module PortaText
  module Exception
    # Raised on invalid accept content type HTTP 406.
    #
    # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
    # Copyright:: Copyright (c) 2015 PortaText
    # License::   Apache-2.0
    class NotAcceptable < RequestError
    end
  end
end
