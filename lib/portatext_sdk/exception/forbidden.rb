module PortaText
  module Exception
    # Raised when access was denied to the resource, HTTP 403.
    #
    # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
    # Copyright:: Copyright (c) 2015 PortaText
    # License::   Apache-2.0
    class Forbidden < RequestError
    end
  end
end
