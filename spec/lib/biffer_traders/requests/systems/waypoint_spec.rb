require "rails_helper"

RSpec.describe ::BifferTraders::Requests::Systems::Waypoint do
  subject { described_class.new(waypoint_symbol: "X1-AA-AAAA") }

  it "should set the proper values" do
    expect(subject.instance_variable_get(:@uri)).to eq("#{::BifferTraders::BASE_URL}/systems/X1-AA/waypoints/X1-AA-AAAA")
  end
end
