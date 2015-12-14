module PortaText
  module Exception
    # Raised when the resource was not found HTTP 404.
    #
    # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
    # Copyright:: Copyright (c) 2015 PortaText
    # License::   Apache-2.0
    class NotFound < RequestError
    end
  end
end
