require "rails_helper"

RSpec.describe ::BifferTraders::Requests::Fleet::Siphon do
  subject { described_class.new(symbol: "AAAA") }

  it "should set the proper values" do
    expect(subject.instance_variable_get(:@uri)).to eq("#{::BifferTraders::BASE_URL}/my/ships/AAAA/siphon")
  end
end