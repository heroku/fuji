require 'spec_helper'

describe Fuji::CustomHeader do
  before do
    @request = OpenStruct.new()
    @links = [Fuji::Link.new("My Custom Link", "http://example.com")]
  end

  it "renders a custom set of links from an options hash" do
    html = Fuji::CustomHeader.render @request, {links: @links}

    html.should match "fuji-custom-header"
    html.should match "My Custom Link"
    html.should_not match "Sign Up"
  end

  it "renders a custom set of links from an array" do
    html = Fuji::CustomHeader.render @request, @links

    html.should match "fuji-custom-header"
    html.should match "My Custom Link"
    html.should_not match "Sign Up"
  end

end