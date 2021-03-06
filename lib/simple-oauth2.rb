require "faraday"
require "addressable/template"
require "addressable/uri"
require "json"
require "models/response"

module Simple
  module Oauth2
    class Client
      attr_accessor :client_id,
                    :client_secret,

                    :redirect_uri,
                    :base_uri,

                    :auth_endpoint,
                    :token_endpoint,

                    :access_token,
                    :refresh_token

      def initialize(props={})
        @client_id = props[:client_id]
        @client_secret = props[:client_secret]

        @redirect_uri = props[:redirect_uri]
        @base_uri = props[:base_uri]

        @auth_endpoint = props[:auth_endpoint]
        @token_endpoint = props[:token_endpoint]

        @access_token = props[:access_token]
        @refresh_token = props[:refresh_token]
      end

      # Returns a new access token.
      def new_access_token
        params = Addressable::URI.new
        params.query_values = {
          type: 'refresh',
          refresh_token: @refresh_token,
          client_id: @client_id,
          redirect_uri: @redirect_uri,
          client_secret: @client_secret
        }
        url = "#{@base_uri}#{@token_endpoint}?#{params.query}"
        conn = Faraday.new(:url => url)
        response = conn.post url
        Response.new(response.body)
      end

      # Exchanges a verification code for an access token.
      def exchange(code)
        params = Addressable::URI.new
        params.query_values = {
          type: 'web_server',
          client_id: @client_id,
          redirect_uri: @redirect_uri,
          client_secret: @client_secret,
          code: code
        }
        uri = "#{@base_uri}#{@token_endpoint}?#{params.query}"
        conn = Faraday.new(:url => uri)
        response = conn.post uri
        binding.pry
        Response.new(response.body)
      end

      # Returns redirect url.
      def redirect_url
        params = Addressable::URI.new
        params.query_values = {
          type: 'web_server',
          client_id: @client_id,
          redirect_uri: @redirect_uri,
        }
        "#{@base_uri}#{@auth_endpoint}?#{params.query}"
      end
    end
  end
end