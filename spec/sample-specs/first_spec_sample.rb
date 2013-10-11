require 'sample_spec_helper'

describe "first" do
  it "should be nil" do
    [].first.should == nil
  end

  it "should be non-nil" do
    [:a].first.should == :a
  end
end
