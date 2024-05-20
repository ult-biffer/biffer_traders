require "rails_helper"

RSpec.describe ::BifferTraders::Requests::Agents::Get do
  it "should set the proper values" do
    expect(subject.instance_variable_get(:@uri)).to eq("#{::BifferTraders::BASE_URL}/my/agent")
  end
end
