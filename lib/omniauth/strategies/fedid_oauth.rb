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

      def build_access_token
        options.token_params.merge!(:headers => {'Accept-Encoding'=>'none'})
        super
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
          :osmose_login => raw_info['uid']
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
