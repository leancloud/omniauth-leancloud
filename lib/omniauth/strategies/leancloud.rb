require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class LeanCloud < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site           => "https://leancloud.cn",
        :authorize_url  => "/1.1/authorize",
        :token_url      => "/1.1/token"
      }

      option :token_params, {
        :parse          => :json
      }

      uid do
        raw_info['id']
      end

      info do
        {
          :username => raw_info['username'],
          :email        => raw_info['email']
        }
      end

      extra do
        {
          :raw_info => raw_info
        }
      end

      def raw_info
        access_token.options[:mode] = :query
        access_token.options[:param_name] = 'access_token'
        @raw_info ||= access_token.get("https://leancloud.cn/1.1/open/clients/self").parsed
      end
    end
  end
end

OmniAuth.config.add_camelization "leancloud", "LeanCloud"