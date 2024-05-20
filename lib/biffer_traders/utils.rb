module BifferTraders
  class Utils
    def self.system_from_waypoint(waypoint)
      waypoint.split("-")[0..-2].join("-")
    end
  end
end
