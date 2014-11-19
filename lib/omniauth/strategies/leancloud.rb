require "omniauth-oauth2"

module OmniAuth
  module Strategies
    class LeanCloud < OmniAuth::Strategies::OAuth2
      option :client_options, {
        :site           => "https://leancloud.cn",
        :authorize_url  => "/1.1/authorize",
        :token_url      => "/1.1/token"
      }

      # option :token_params, {
      #   :parse          => :json
      # }

      uid do
        raw_info['id']
      end

      info do
        {
          :name         => raw_info['username'],
          :email        => raw_info['email']
        }
      end

      extra do
        {
          :raw_info => raw_info
        }
      end

      def authorize_params
        super.tap do |params|
          %w[scope client_options].each do |v|
            if request.params[v]
              params[v.to_sym] = request.params[v]
            end
          end
        end
      end
      
      def raw_info
        access_token.options[:mode] = :query
        # access_token.options[:param_name] = 'access_token'
        # @uid ||= access_token.get('clients/self').parsed["uid"]
        @raw_info ||= access_token.get("/clients/self").parsed
      end
    end
  end
end

OmniAuth.config.add_camelization "leancloud", "LeanCloud"