require 'spec_helper'

describe Fuji::Helper do
  it "converts strings to CSS classes" do
    Fuji::Helper.dehumanize("My Class").should == "my-class"
  end

  it "reduces all non-word characters to a single dash" do
    Fuji::Helper.dehumanize("Help & Support").should == "help-support"
    Fuji::Helper.dehumanize("Help   Support").should == "help-support"
  end
end