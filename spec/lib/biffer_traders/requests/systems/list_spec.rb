require "rails_helper"

RSpec.describe ::BifferTraders::Requests::Systems::List do
  it "should set the proper values" do
    expect(subject.instance_variable_get(:@uri)).to eq("#{::BifferTraders::BASE_URL}/systems")
  end
end