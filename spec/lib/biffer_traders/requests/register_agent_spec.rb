require "rails_helper"

RSpec.describe ::BifferTraders::Requests::RegisterAgent do
  subject { described_class.new(symbol: "TESTBIFFER") }

  it "sets the proper values" do
    expect(subject.instance_variable_get(:@options)[:json]["faction"]).to eq("COSMIC")
    expect(subject.instance_variable_get(:@options)[:json]["symbol"]).to eq("TESTBIFFER")
  end
end
