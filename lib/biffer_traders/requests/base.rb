require "httpx"

module BifferTraders
  module Requests
    class Base
      def initialize(verb, uri, options = Hash.new)
        @verb    = verb.upcase
        @uri     = "#{::BifferTraders::BASE_URL}#{uri}"
        @options = options

        @options[:params] = spaceify(@options[:params])
        @options[:json]   = spaceify(@options[:json])
      end

      def execute
        response = ::HTTPX::Session.new.wrap do |http|
          request = http.build_request(@verb, @uri, @options)
          http.request(request)
        end

        [response.status, railsify(JSON.parse(response.body.read))]
      end

      def railsify(h)
        return unless h.is_a?(Hash)

        h.deep_transform_keys do |key|
          key.underscore.to_sym
        end
      end

      def spaceify(h)
        return unless h.is_a?(Hash)

        h.deep_transform_keys do |key|
          key.to_s.camelize(:lower)
        end
      end
    end
  end
end
