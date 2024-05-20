require "httpx"
require "biffer_traders/requests/base"

module BifferTraders
  module Requests
    class Authenticated < Base
      def initialize(verb, uri, options = {})
        token = ::BifferTraders::Config[:token]
        raise ArgumentError.new("Must supply a token!") if token.nil? || token.blank?

        super
      end

      def http_session
        HTTPX.plugin(:auth).bearer_auth(::BifferTraders::Config[:token])
      end
    end
  end
end
