require 'sample_spec_helper'

describe "first" do
  it "should be nil" do
    expect([].first).to eq nil
  end

  it "should be non-nil" do
    expect([:a].first).to eq :a
  end
end
