require "rails_helper"

RSpec.describe ::BifferTraders::Requests::Fleet::PurchaseShip do
  subject { described_class.new(ship_type: "SHIP_PROBE", waypoint_symbol: "X1-AA-AAAA") }

  it "should set the proper values" do
    expect(subject.instance_variable_get(:@uri)).to eq("#{::BifferTraders::BASE_URL}/my/ships")
  end
end
