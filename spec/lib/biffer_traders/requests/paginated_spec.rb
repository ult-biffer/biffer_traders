require "rails_helper"

RSpec.describe ::BifferTraders::Requests::Paginated do
  subject { described_class.new("/") }
  let(:params) { subject.instance_variable_get(:@options)[:params] }

  it "should set the limit and page" do
    expect(params["limit"]).to eq(::BifferTraders::Requests::Paginated::LIMIT)
    expect(params["page"]).to eq(1)
  end
end