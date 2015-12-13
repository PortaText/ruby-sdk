module PortaText
  module Exception
    # Generic endpoint request error
    #
    # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
    # Copyright:: Copyright (c) 2015 PortaText
    # License::   Apache-2.0
    class RequestError < ::Exception
      attr_reader :descriptor

      def initialize(descriptor, message)
        super message
        @descriptor = descriptor
      end
    end
  end
end
