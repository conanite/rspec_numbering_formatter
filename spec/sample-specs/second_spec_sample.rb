require 'sample_spec_helper'

describe "second sample" do
  it "should include a broken test" do
    (1 + 1).should == 3
  end

  it "should be true" do
    true.should == true
  end
end
