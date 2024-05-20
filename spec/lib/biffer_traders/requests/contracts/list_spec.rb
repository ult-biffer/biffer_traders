require "rails_helper"

RSpec.describe ::BifferTraders::Requests::Contracts::List do
  it "should set the proper values" do
    expect(subject.instance_variable_get(:@options)[:params]["page"]).to eq(1)
  end
end
