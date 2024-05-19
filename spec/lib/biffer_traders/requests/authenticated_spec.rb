require 'rails_helper'

RSpec.describe ::BifferTraders::Requests::Authenticated do
  subject { described_class.new("GET", "/my/agent") }

  context "with a token present" do
    before do
      if ENV["BIFFER_TRADERS_TOKEN"].nil? || ENV["BIFFER_TRADERS_TOKEN"].blank?
        ENV["BIFFER_TRADERS_TOKEN"] = "aaaa"
      end
    end

    it "should add the headers" do
      expect(subject.instance_variable_get(:@options)[:headers][:Authorization]).to match(/Bearer .+/)
    end
  end

  context "without a token" do
    before do
      @token = ENV["BIFFER_TRADERS_TOKEN"]
      ENV["BIFFER_TRADERS_TOKEN"] = ""
    end

    after do
      ENV["BIFFER_TRADERS_TOKEN"] = @token
    end

    it "should raise an error" do
      expect { subject }.to raise_error ArgumentError
    end
  end
end