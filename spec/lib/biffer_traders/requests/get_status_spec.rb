require "rails_helper"

RSpec.describe ::BifferTraders::Requests::GetStatus do
  it "sets the proper values" do
    expect(subject.instance_variable_get(:@uri)).to eq("#{::BifferTraders::BASE_URL}/")
  end
end