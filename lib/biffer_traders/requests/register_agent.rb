require "biffer_traders/requests/base"

module BifferTraders
  module Requests
    class RegisterAgent < Base
      def initialize(symbol:, faction: "COSMIC")
        json = { symbol:, faction: }
        super("POST", "/register", { json: })
      end
    end
  end
end