module PortaText
  module Exception
    # Raised when not enough funds, HTTP 402.
    #
    # Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
    # Copyright:: Copyright (c) 2015 PortaText
    # License::   Apache-2.0
    class PaymentRequired < RequestError
    end
  end
end
