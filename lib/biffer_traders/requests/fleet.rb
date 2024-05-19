require "biffer_traders/requests/authenticated"
require "biffer_traders/requests/paginated"

module BifferTraders
  module Requests
    module Fleet
      # Shared Ship class
      private class Ship < ::BifferTraders::Requests::Authenticated
        def initialize(verb, symbol, path = "", options = Hash.new)
          uri = "/my/ships/#{symbol}#{path}"
          super(verb, uri, options)
        end
      end

      class List < ::BifferTraders::Requests::Paginated
        def initialize(page: 1)
          super("/my/ships", page)
        end
      end

      class PurchaseShip < ::BifferTraders::Requests::Authenticated
        def initialize(ship_type:, waypoint_symbol:)
          json = { ship_type:, waypoint_symbol: }
          super("POST", "/my/ships", json:)
        end
      end

      class Get < Ship
        def initialize(symbol:)
          super("GET", symbol)
        end
      end

      class GetCargo < Ship
        def initialize(symbol:)
          super("GET", symbol, "/cargo")
        end
      end

      class GetMounts < Ship
        def initialize(symbol:)
          super("GET", symbol, "/mounts")
        end
      end

      class InstallMount < Ship
        def initialize(ship_symbol:, symbol:)
          super("POST", ship_symbol, "/mounts/install", json: { symbol: })
        end
      end

      class RemoveMount < Ship
        def initialize(ship_symbol:, symbol:)
          super("POST", ship_symbol, "/mounts/remove", json: { symbol: })
        end
      end

      class Orbit < Ship
        def initialize(symbol:)
          super("POST", symbol, "/orbit")
        end
      end

      class Refine < Ship
        def initialize(symbol:, produce:)
          super("POST", symbol, "/refine", json: { produce: })
        end
      end

      class Chart < Ship
        def initialize(symbol:)
          super("POST", symbol, "/chart")
        end
      end

      class Cooldown < Ship
        def initialize(symbol:)
          super("GET", symbol, "/cooldown")
        end
      end

      class Dock < Ship
        def initialize(symbol:)
          super("POST", symbol, "/dock")
        end
      end

      class Survey < Ship
        def initialize(symbol:)
          super("POST", symbol, "/survey")
        end
      end

      class Extract < Ship
        def initialize(symbol:)
          super("POST", symbol, "/extract")
        end
      end

      class Siphon < Ship
        def initialize(symbol:)
          super("POST", symbol, "/siphon")
        end
      end

      class ExtractSurvey < Ship
        def initialize(symbol:, survey:)
          super("POST", symbol, "/extract/survey", json: survey)
        end
      end

      class Jettison < Ship
        def initialize(ship_symbol:, cargo_symbol:, units:)
          json = { symbol: cargo_symbol, units: }
          super("POST", ship_symbol, "/jettison", json:)
        end
      end

      class Jump < Ship
        def initialize(ship_symbol:, waypoint_symbol:)
          super("POST", ship_symbol, "/jump", json: { waypoint_symbol: })
        end
      end

      class Navigate < Ship
        def initialize(ship_symbol:, waypoint_symbol:)
          super("POST", ship_symbol, "/navigate", json: { waypoint_symbol: })
        end
      end

      class PatchNav < Ship
        def initialize(symbol:, flight_mode: "CRUISE")
          super("PATCH", symbol, "/nav", json: { flight_mode: })
        end
      end

      class GetNav < Ship
        def initialize(symbol:)
          super("GET", symbol, "/nav")
        end
      end

      class Warp < Ship
        def initialize(ship_symbol:, waypoint_symbol:)
          super("POST", ship_symbol, "/warp", json: { waypoint_symbol: })
        end
      end

      class Sell < Ship
        def initialize(ship_symbol:, symbol:, units:)
          super("POST", ship_symbol, "/sell", json: { symbol:, units: })
        end
      end

      class Purchase < Ship
        def initialize(ship_symbol:, symbol:, units:)
          super("POST", ship_symbol, "/purchase", json: { symbol:, units: })
        end
      end

      class Transfer < Ship
        def initialize(from_symbol:, trade_symbol:, ship_symbol:, units:)
          json = { trade_symbol:, ship_symbol:, units: }
          super("POST", from_symbol, "/transfer", json:)
        end
      end

      class Refuel < Ship
        def initialize(symbol:, units:, from_cargo:)
          super("POST", symbol, "/refuel", json: { units:, from_cargo: })
        end
      end

      class Negotiate < Ship
        def initialize(symbol:)
          super("POST", symbol, "/negotiate/contract")
        end
      end

      class GetScrap < Ship
        def initialize(symbol:)
          super("GET", symbol, "/scrap")
        end
      end

      class Scrap < Ship
        def initialize(symbol:)
          super("POST", symbol, "/scrap")
        end
      end

      class GetRepair < Ship
        def initialize(symbol:)
          super("GET", symbol, "/repair")
        end
      end

      class Repair < Ship
        def initialize(symbol:)
          super("POST", symbol, "/repair")
        end
      end

      private class Scan < Ship
        def initialize(ship_symbol, path)
          super("POST", ship_symbol, "/scan#{path}")
        end
      end

      class ScanSystems < Scan
        def initialize(symbol:)
          super(symbol, "/systems")
        end
      end

      class ScanWaypoints < Scan
        def initialize(symbol:)
          super(symbol, "/waypoints")
        end
      end

      class ScanShips < Scan
        def initialize(symbol:)
          super(symbol, "/ships")
        end
      end
    end
  end
end