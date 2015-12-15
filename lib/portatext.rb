require_relative 'portatext/exception/request_error'
require_relative 'portatext/exception/server_error'
require_relative 'portatext/exception/rate_limited'
require_relative 'portatext/exception/invalid_media'
require_relative 'portatext/exception/invalid_method'
require_relative 'portatext/exception/not_found'
require_relative 'portatext/exception/forbidden'
require_relative 'portatext/exception/payment_required'
require_relative 'portatext/exception/invalid_credentials'
require_relative 'portatext/exception/client_error'
require_relative 'portatext/client/base_client'
require_relative 'portatext/client/http_client'
require_relative 'portatext/command/descriptor'
require_relative 'portatext/command/result'
require_relative 'portatext/command/base'
require_relative 'portatext/command/api/tariffs'
require_relative 'portatext/command/api/me'
require_relative 'portatext/command/api/acl'
require_relative 'portatext/command/api/settings'
require_relative 'portatext/command/api/did_settings'
require_relative 'portatext/command/api/credit_cards'
require_relative 'portatext/command/api/email_verify'
require_relative 'portatext/command/api/templates'
require_relative 'portatext/command/api/sms'
require_relative 'portatext/command/api/timezones'
require_relative 'portatext/command/api/cnam'
require_relative 'portatext/command/api/recharge'
require_relative 'portatext/command/api/jobs'
require_relative 'portatext/command/api/contact_lists'
require_relative 'portatext/command/api/did_search'
require_relative 'portatext/command/api/blacklist'
require_relative 'portatext/command/api/campaigns'
require_relative 'portatext/command/api/sms_campaign'

# The PortaText namespace.
#
# Author::    Marcelo Gornstein (mailto:marcelog@portatext.com)
# Copyright:: Copyright (c) 2015 PortaText
# License::   Apache-2.0
module PortaText
  DEFAULT_ENDPOINT = 'https://rest.portatext.com'
end
