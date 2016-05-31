# Copyright (c) 2016 Ricoh Company, Ltd. All Rights Reserved.
# See LICENSE for more information

require 'rack/oauth2'

module RicohAPI
  module Auth
    TOKEN_ENDPOINT = 'https://auth.beta2.ucs.ricoh.com/auth/token'
    DISCOVERY_ENDPOINT = 'https://auth.beta2.ucs.ricoh.com/auth/discovery'
    DISCOVERY_RELATED_SCOPES = [
      'https://ucs.ricoh.com/scope/api/auth',
      'https://ucs.ricoh.com/scope/api/discovery'
    ]
  end
end

require 'ricohapi/auth/version'
require 'ricohapi/auth/client'
require 'ricohapi/auth/access_token'