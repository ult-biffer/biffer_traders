require "biffer_traders/requests/base"

module BifferTraders
  module Requests
    class GetStatus < Base
      def initialize
        super("GET", "/")
      end
    end
  end
end
