require "rails_helper"

RSpec.describe ::BifferTraders::Requests::Fleet::Sell do
  subject { described_class.new(ship_symbol: "AAAA", symbol: "ICE_WATER", units: 1) }

  it "should set the proper values" do
    expect(subject.instance_variable_get(:@uri)).to eq("#{::BifferTraders::BASE_URL}/my/ships/AAAA/sell")
  end
end