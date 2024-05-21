require "rails_helper"

RSpec.describe ::BifferTraders::Types::LocationSymbol do
  subject { described_class.new("X1-AAAA-AAAA") }

  context "happy path" do
    it "should validate" do
      expect(subject.valid?).to eq(true)
      expect(subject.waypoint?).to eq(true)
      expect(subject.system?).to eq(false)
      expect(subject.to_s).to eq("X1-AAAA-AAAA")
    end

    context "with system instead" do
      subject { described_class.new("X1-AAAA") }

      it "should validate" do
        expect(subject.valid?).to eq(true)
        expect(subject.waypoint?).to eq(false)
        expect(subject.system?).to eq(true)
        expect(subject.to_s).to eq("X1-AAAA")
      end
    end
  end

  context "sad path" do
    subject { described_class.new("lol") }

    it "should not validate" do
      expect(subject.valid?).to eq(false)
      expect(subject.waypoint?).to eq(false)
      expect(subject.system?).to eq(false)
    end
  end
end
