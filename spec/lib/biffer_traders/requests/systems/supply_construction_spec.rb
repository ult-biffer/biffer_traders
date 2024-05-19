require "rails_helper"

RSpec.describe ::BifferTraders::Requests::Systems::SupplyConstruction do
  subject { described_class.new(waypoint_symbol: "X1-AA-AAAA", ship_symbol: "AAAA", trade_symbol: "ICE_WATER", units: 1) }

  it "should set the proper values" do
    expect(subject.instance_variable_get(:@uri)).to eq("#{::BifferTraders::BASE_URL}/systems/X1-AA/waypoints/X1-AA-AAAA/construction/supply")
  end
end