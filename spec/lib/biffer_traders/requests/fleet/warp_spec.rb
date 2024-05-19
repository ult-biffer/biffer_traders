require "rails_helper"

RSpec.describe ::BifferTraders::Requests::Fleet::Warp do
  subject { described_class.new(ship_symbol: "AAAA", waypoint_symbol: "X1-AA-AAAA") }

  it "should set the proper values" do
    expect(subject.instance_variable_get(:@uri)).to eq("#{::BifferTraders::BASE_URL}/my/ships/AAAA/warp")
  end
end