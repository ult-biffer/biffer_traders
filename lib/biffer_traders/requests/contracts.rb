require "biffer_traders/requests/authenticated"
require "biffer_traders/requests/paginated"

module BifferTraders
  module Requests
    module Contracts
      class Get < ::BifferTraders::Requests::Authenticated
        def initialize(id:)
          super("GET", "/my/contracts/#{id}")
        end
      end

      class List < ::BifferTraders::Requests::Paginated
        def initialize(page: 1)
          super("/my/contracts", page)
        end
      end

      class Accept < ::BifferTraders::Requests::Authenticated
        def initialize(id:)
          super("POST", "/my/contracts/#{id}/accept")
        end
      end

      class Deliver < ::BifferTraders::Requests::Authenticated
        def initialize(id, ship_symbol:, trade_symbol:, units:)
          json = { ship_symbol:, trade_symbol:, units: }
          super("POST", "/my/contracts/#{id}/deliver", json:)
        end
      end

      class Fulfill < ::BifferTraders::Requests::Authenticated
        def initialize(id:)
          super("POST", "/my/contracts/#{id}/fulfill")
        end
      end
    end
  end
end