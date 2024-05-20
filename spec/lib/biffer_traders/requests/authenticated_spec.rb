require "rails_helper"

RSpec.describe ::BifferTraders::Requests::Authenticated do
  subject { described_class.new("GET", "/my/agent") }

  context "with a token present" do
    before do
      ::BifferTraders::Config[:token] ||= "aaaa"
    end

    it "should add the headers" do
      header = subject.http_session.instance_variable_get(:@options).to_hash[:headers][:authorization]
      expect(header).to match(/Bearer .+/)
    end
  end

  context "without a token" do
    before do
      @token = ::BifferTraders::Config[:token]
      ::BifferTraders::Config[:token] = ""
    end

    after do
      ::BifferTraders::Config[:token] = @token
    end

    it "should raise an error" do
      expect { subject }.to raise_error ArgumentError
    end
  end
end
