require "rails_helper"

RSpec.describe ::BifferTraders::Requests::Contracts::Accept do
  subject { described_class.new(id: "AAAA") }

  it "should set the proper values" do
    expect(subject.instance_variable_get(:@uri)).to eq("#{::BifferTraders::BASE_URL}/my/contracts/AAAA/accept")
  end
end
