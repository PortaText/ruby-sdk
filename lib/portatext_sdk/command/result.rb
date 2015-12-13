module PortaText
  module Command
    # This class holds the result of calling the endpoint.
    #
    # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
    # Copyright:: Copyright (c) 2015 PortaText
    # License::   Apache-2.0
    class Result
      attr_accessor :code
      attr_accessor :headers
      attr_accessor :data
      attr_reader :success

      def initialize(code, headers, data)
        @code = code
        @headers = headers
        @data = data

        @success = code > 199 && code < 300 && data['success']
      end
    end
  end
end
