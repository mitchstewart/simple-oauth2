require "json"
require "pry"
require 'date'

module Simple
  module Oauth2
    class Response
      attr_accessor :access_token,
                    :refresh_token
                    :expires_at
      
      attr_reader :seconds_in_day
      
      # json: {
      #   access_token: 'Basecamp access token'
      #   refresh_token: 'Basecamp refresh token'
      #   expires_in: 'epoch time stamp'   
      # }
      def initialize(json)
        @seconds_in_day = 86400
        json = JSON.parse(json)
        @access_token = json['access_token']
        @expires_at = DateTime.now.to_date + 
                      Rational(json['expires_in'], @seconds_in_day)
        @refresh_token = json['refresh_token']
      end
    end
  end
end