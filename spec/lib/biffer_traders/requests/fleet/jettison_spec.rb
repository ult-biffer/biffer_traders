require "rails_helper"

RSpec.describe ::BifferTraders::Requests::Fleet::Jettison do
  subject { described_class.new(ship_symbol: "AAAA", cargo_symbol: "COPPER_ORE", units: 1) }

  it "should set the proper values" do
    expect(subject.instance_variable_get(:@uri)).to eq("#{::BifferTraders::BASE_URL}/my/ships/AAAA/jettison")
  end
end
