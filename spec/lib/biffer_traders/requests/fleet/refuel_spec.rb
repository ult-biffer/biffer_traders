require "rails_helper"

RSpec.describe ::BifferTraders::Requests::Fleet::Refuel do
  subject { described_class.new(symbol: "AAAA", units: 1, from_cargo: false) }

  it "should set the proper values" do
    expect(subject.instance_variable_get(:@uri)).to eq("#{::BifferTraders::BASE_URL}/my/ships/AAAA/refuel")
  end
end
