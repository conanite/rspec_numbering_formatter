require 'sample_spec_helper'

describe "second sample" do
  it "should include a broken test" do
    expect((1 + 1)).to eq 3
  end

  it "should be true" do
    expect(true).to eq true
  end
end
