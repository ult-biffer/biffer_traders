require "biffer_traders/types/location_symbol"

module BifferTraders
  class Utils
    def self.system_from_waypoint(waypoint)
      ::BifferTraders::Types::LocationSymbol.new(waypoint).system_string
    end
  end
end
