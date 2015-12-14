require_relative 'portatext_sdk/client/base_client'
require_relative 'portatext_sdk/client/http_client'
require_relative 'portatext_sdk/command/descriptor'
require_relative 'portatext_sdk/command/result'
require_relative 'portatext_sdk/command/base'
require_relative 'portatext_sdk/command/api/tariffs'
require_relative 'portatext_sdk/command/api/me'
require_relative 'portatext_sdk/exception/request_error'
require_relative 'portatext_sdk/exception/server_error'
require_relative 'portatext_sdk/exception/rate_limited'
require_relative 'portatext_sdk/exception/invalid_media'
require_relative 'portatext_sdk/exception/invalid_method'
require_relative 'portatext_sdk/exception/not_found'
require_relative 'portatext_sdk/exception/forbidden'
require_relative 'portatext_sdk/exception/payment_required'
require_relative 'portatext_sdk/exception/invalid_credentials'
require_relative 'portatext_sdk/exception/client_error'

# The PortaText namespace.
#
# Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
# Copyright:: Copyright (c) 2015 PortaText
# License::   Apache-2.0
module PortaText
  DEFAULT_ENDPOINT = 'https://rest.portatext.com'
end
