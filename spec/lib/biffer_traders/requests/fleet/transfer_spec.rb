require "rails_helper"

RSpec.describe ::BifferTraders::Requests::Fleet::Transfer do
  subject { described_class.new(from_symbol: "AAAA", trade_symbol: "ICE_WATER", units: 1, ship_symbol: "AAAAA") }

  it "should set the proper values" do
    expect(subject.instance_variable_get(:@uri)).to eq("#{::BifferTraders::BASE_URL}/my/ships/AAAA/transfer")
  end
end
