require "rails_helper"

RSpec.describe ::BifferTraders::Requests::Systems::Waypoints do
  subject { described_class.new(symbol: "X1-AA") }

  it "should set the proper values" do
    expect(subject.instance_variable_get(:@uri)).to eq("#{::BifferTraders::BASE_URL}/systems/X1-AA/waypoints")
  end
end
