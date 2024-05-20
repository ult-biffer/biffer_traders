require "rails_helper"

RSpec.describe ::BifferTraders::Requests::Agents::GetPublicAgent do
  subject { ::BifferTraders::Requests::Agents::GetPublicAgent.new(symbol: "AAAA") }

  it "should set the proper values" do
    expect(subject.instance_variable_get(:@uri)).to eq("#{::BifferTraders::BASE_URL}/agents/AAAA")
  end
end
