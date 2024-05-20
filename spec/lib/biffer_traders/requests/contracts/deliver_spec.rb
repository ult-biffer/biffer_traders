require "spec_helper"

RSpec.describe ::BifferTraders::Requests::Contracts::Deliver do
  subject { described_class.new("AAAA", ship_symbol: "AAAA", trade_symbol: "AAAA", units: 0) }

  it "should set the proper values" do
    expect(subject.instance_variable_get(:@options)[:json]["shipSymbol"]).to eq("AAAA")
  end
end
