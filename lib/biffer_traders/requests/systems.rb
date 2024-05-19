require "biffer_traders/requests/authenticated"
require "biffer_traders/requests/paginated"
require "biffer_traders/utils"

module BifferTraders
  module Requests
    module Systems
      class SystemPath
        def initialize(waypoint_symbol: nil, system_symbol: nil, path: "")
          raise ArgumentError unless waypoint_symbol || system_symbol
          @path = path
          @waypoint = waypoint_symbol.presence
          @system = system_symbol.presence || BifferTraders::Utils.system_from_waypoint(@waypoint)
        end

        def to_s
          s = ""
          s += "/systems/#{@system}"
          s += "/waypoints/#{@waypoint}" if @waypoint
          s + @path
        end
      end

      class List < ::BifferTraders::Requests::Paginated
        def initialize(page: 1)
          super("/systems", page)
        end
      end

      class Get < ::BifferTraders::Requests::Authenticated
        def initialize(symbol:)
          super("GET", SystemPath.new(system_symbol: symbol).to_s)
        end
      end

      class Waypoints < ::BifferTraders::Requests::Paginated
        def initialize(symbol:, page: 1, options: Hash.new)
          filters = { traits: options[:traits], type: options[:type] }.reject { |_, v| v.nil? }
          super(SystemPath.new(system_symbol: symbol, path: "/waypoints").to_s, page, params: filters)
        end
      end

      class Waypoint < ::BifferTraders::Requests::Authenticated
        def initialize(waypoint_symbol:, path: "")
          super("GET", SystemPath.new(waypoint_symbol:, path:).to_s)
        end
      end

      class Market < Waypoint
        def initialize(waypoint_symbol:)
          super(path: "/market", waypoint_symbol:)
        end
      end

      class Shipyard < Waypoint
        def initialize(waypoint_symbol:)
          super(path: "/shipyard", waypoint_symbol:)
        end
      end

      class JumpGate < Waypoint
        def initialize(waypoint_symbol:)
          super(path: "/jump-gate", waypoint_symbol:)
        end
      end

      class Construction < Waypoint
        def initialize(waypoint_symbol:)
          super(path: "/construction", waypoint_symbol:)
        end
      end

      class SupplyConstruction < ::BifferTraders::Requests::Authenticated
        def initialize(waypoint_symbol:, ship_symbol:, trade_symbol:, units:)
          path = SystemPath.new(path: "/construction/supply", waypoint_symbol:)
          json = { ship_symbol:, trade_symbol:, units: }

          super("POST", path.to_s, json:)
        end
      end
    end
  end
end