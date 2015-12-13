require_relative 'portatext_sdk/client/base_client'
require_relative 'portatext_sdk/client/http_client'
require_relative 'portatext_sdk/command/descriptor'
require_relative 'portatext_sdk/command/result'
require_relative 'portatext_sdk/exception/request_error'

# The PortaText namespace.
#
# Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
# Copyright:: Copyright (c) 2015 PortaText
# License::   Apache-2.0
module PortaText
  DEFAULT_ENDPOINT = 'https://rest.portatext.com'
end
