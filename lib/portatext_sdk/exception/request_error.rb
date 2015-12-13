module PortaText
  module Exception
    # Generic endpoint request error
    #
    # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
    # Copyright:: Copyright (c) 2015 PortaText
    # License::   Apache-2.0
    class RequestError < ::Exception
      attr_reader :descriptor
      attr_reader :original

      def initialize(descriptor, message = nil, original = nil)
        super message
        @descriptor = descriptor
        @original = original
      end
    end
  end
end
