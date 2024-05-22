module BifferTraders
  module Types
    SECTORS = %w[X1].freeze

    class LocationSymbol
      def initialize(symbol)
        @symbol = symbol
      end

      def valid?
        is_valid_size? && sector_valid? && system_valid?
      end

      def waypoint?
        waypoint_part.present?
      end

      def system?
        system_part.present? && !waypoint_part.present?
      end

      def system_string
        "#{sector_part}-#{system_part}"
      end

      def waypoint
        "#{sector_part}-#{system_part}-#{waypoint_part}"
      end

      def to_s
        waypoint? ? waypoint : system_string
      end

      private

      def sector_valid?
        sector_part.length == 2 && ::BifferTraders::Types::SECTORS.include?(sector_part)
      end

      def system_valid?
        system_part.present?
      end

      def is_valid_size?
        waypoint? || system?
      end

      def sector_part
        @sector_part = parts[0] if !defined?(@sector_part)
        @sector_part
      end

      def system_part
        @system_part = parts[1] if !defined?(@system_part)
        @system_part
      end

      def waypoint_part
        @waypoint_part = parts[2] if !defined?(@waypoint_part)
        @waypoint_part
      end

      def parts
        @parts ||= @symbol.split("-")
      end
    end
  end
end
