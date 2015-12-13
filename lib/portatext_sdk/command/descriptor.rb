module PortaText
  module Command
    # This class holds the descriptor with the needed information to call an
    # endpoint.
    #
    # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
    # Copyright:: Copyright (c) 2015 PortaText
    # License::   Apache-2.0
    class Descriptor
      attr_accessor :uri
      attr_accessor :method
      attr_accessor :headers
      attr_accessor :body

      def initialize(uri, method, headers, body)
        @uri = uri
        @method = method
        @headers = headers
        @body = body
      end
    end
  end
end
