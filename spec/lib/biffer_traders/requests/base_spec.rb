require 'rails_helper'

RSpec.describe ::BifferTraders::Requests::Base do
  let(:mock_http) { HTTPX::Session.new }
  let(:url) { "/" }
  let(:request_method) { "GET" }
  subject { described_class.new(request_method, url) }

  it "calls the url and returns values" do
    expect(HTTPX::Session).to receive(:new).and_return mock_http
    expect(mock_http).to receive(:build_request).with(request_method, "#{::BifferTraders::BASE_URL}#{url}", { json: nil, params: nil }).and_return 'aaaa'
    expect(mock_http).to receive(:request).and_return(double(status: 200, body: double(read: '{"somethingCamel": "value"}')))

    response = subject.execute
    expect(response[0]).to eq(200)
    expect(response[1][:something_camel]).to eq("value")
  end

  context "railsifying output" do
    let(:response) do
      {
        "somethingCamel" => "value",
        "lowercase" => 2
      }
    end

    let(:railsified) { subject.railsify(response) }

    it "should underscore capitals while leaving lowercase" do
      expect(railsified[:something_camel]).to eq("value")
      expect(railsified[:lowercase]).to eq(2)
    end
  end

  context "spaceifying input" do
    let(:input) do
      {
        something_snakey: "value",
        oneword: 2
      }
    end

    let(:spaceified) { subject.spaceify(input) }

    it "should capitalize underscores while leaving lowercase" do
      expect(spaceified["somethingSnakey"]).to eq("value")
      expect(spaceified["oneword"]).to eq(2)
    end
  end
end