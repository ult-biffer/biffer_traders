require 'httpx'

module BifferTraders
  module Requests
    class Paginated < Authenticated
      LIMIT = 20

      def initialize(uri, page = 1, options = Hash.new)
        super("GET", uri, options.deep_merge(params: { limit: LIMIT, page: }))
      end
    end
  end
end