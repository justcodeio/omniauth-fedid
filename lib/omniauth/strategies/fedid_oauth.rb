require 'omniauth-oauth2'
require 'omniauth/strategies/oauth2'

module OmniAuth
  module Strategies
    class FedidOauth < OmniAuth::Strategies::OAuth2
      option :name, 'fedid_oauth'
      option :client_options, {
        authorize_url: '/as/authorization.oauth2',
        token_url: '/as/token.oauth2'
      }
      option :token_options, %i[headers]
      option :headers, 'Accept-Encoding': 'none'
      option :pkce, false
      option :pkce_verifier, nil
      option :pkce_options, {
        :code_challenge => proc { |verifier|
          Base64.urlsafe_encode64(
            Digest::SHA2.digest(verifier),
            :padding => false,
          )
        },
        :code_challenge_method => "S256",
      }

      def build_access_token
        redirect_uri = full_host + script_name + callback_path
        verifier = request.params["code"]
        client.auth_code.get_token(verifier, {:redirect_uri => redirect_uri}.merge(token_params.to_hash(:symbolize_keys => true)), deep_symbolize(options.auth_token_params))
      end

      uid { raw_info['uid'] }

      info do
        {
          :name => raw_info['displayName'],
          :email => raw_info['mail'],
          :mobile => raw_info['mobile'],
          :photo => raw_info['photourl'],
          :country => raw_info['c'],
          :site => raw_info['site'],
          :site_name => raw_info['sitename'],
          :osmose_login => raw_info['uid'],
          :user_login => raw_info['uid']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.post('/idp/userinfo.openid', headers: {'Accept-Encoding': 'none'}).parsed
      end
    end
  end
end
