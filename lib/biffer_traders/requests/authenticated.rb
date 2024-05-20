require "httpx"
require "biffer_traders/requests/base"

module BifferTraders
  module Requests
    class Authenticated < Base
      def initialize(verb, uri, options = {})
        raise ArgumentError.new("Must supply a token!") if ENV["BIFFER_TRADERS_TOKEN"].nil? || ENV["BIFFER_TRADERS_TOKEN"].blank?
        options[:headers] = {Authorization: "Bearer #{ENV["BIFFER_TRADERS_TOKEN"]}"}

        super
      end
    end
  end
end
