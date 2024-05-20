require "rails_helper"

RSpec.describe ::BifferTraders::Requests::Factions::Get do
  subject { described_class.new(symbol: "AAAA") }

  it "should set the proper values" do
    expect(subject.instance_variable_get(:@uri)).to eq("#{::BifferTraders::BASE_URL}/factions/AAAA")
  end
end
