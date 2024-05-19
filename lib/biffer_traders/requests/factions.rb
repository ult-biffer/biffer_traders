require "biffer_traders/requests/authenticated"
require "biffer_traders/requests/paginated"

module BifferTraders
  module Requests
    module Factions
      class Get < ::BifferTraders::Requests::Authenticated
        def initialize(symbol:)
          super("GET", "/factions/#{symbol}")
        end
      end

      class List < ::BifferTraders::Requests::Paginated
        def initialize(page: 1)
          super("/factions", page)
        end
      end
    end
  end
end