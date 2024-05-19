require "biffer_traders/requests/authenticated"
require "biffer_traders/requests/paginated"

module BifferTraders
  module Requests
    module Agents
      class GetPublicAgent < ::BifferTraders::Requests::Authenticated
        def initialize(symbol:)
          super("GET", "/agents/#{symbol}")
        end
      end

      class Get < ::BifferTraders::Requests::Authenticated
        def initialize
          super("GET", "/my/agent")
        end
      end

      class List < ::BifferTraders::Requests::Paginated
        def initialize(page: 1)
          super("/agents", page)
        end
      end
    end
  end
end