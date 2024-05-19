require "rails_helper"

RSpec.describe ::BifferTraders::Requests::Fleet::PatchNav do
  subject { described_class.new(symbol: "AAAA", flight_mode: "CRUISE") }

  it "should set the proper values" do
    expect(subject.instance_variable_get(:@uri)).to eq("#{::BifferTraders::BASE_URL}/my/ships/AAAA/nav")
  end
end