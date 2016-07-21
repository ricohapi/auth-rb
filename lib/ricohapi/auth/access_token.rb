# Copyright (c) 2016 Ricoh Company, Ltd. All Rights Reserved.
# See LICENSE for more information

require 'json/jwt'

module RicohAPI
  module Auth
    class AccessToken < Rack::OAuth2::AccessToken::Bearer
      EXPIRE_MARGIN = 10
      def initialize(token, options = {})
        super options.merge(
          access_token: token
        )
      end

      def api_token_for!(scope)
        # CAUTION: Discovery request updates the refresh_token.
        res = get DISCOVERY_ENDPOINT, {
          scope: scope
        }
        json = JSON.parse(res.body).with_indifferent_access[scope]
        self.class.new json[:access_token], json
      end

      def subject
        # NOTE: we should follow OpenID Connect, not our custom id_token-ish access_token format.
        claims[:prn]
      end

      def expired?
        Time.now >= Time.at(claims[:exp]) - EXPIRE_MARGIN
      end

      private

      def claims
        @claims ||= JSON::JWT.decode access_token, :skip_verification
      end
    end
  end
end
