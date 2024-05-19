require "rails_helper"

RSpec.describe ::BifferTraders::Requests::Fleet::InstallMount do
  subject { described_class.new(ship_symbol: "AAAA", symbol: "MOUNT_GAS_SIPHON_I") }

  it "should set the proper values" do
    expect(subject.instance_variable_get(:@uri)).to eq("#{::BifferTraders::BASE_URL}/my/ships/AAAA/mounts/install")
  end
end