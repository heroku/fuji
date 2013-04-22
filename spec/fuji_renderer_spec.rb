require 'spec_helper'

describe Fuji::Renderer do
  # Private method
  describe "#render" do
    it "should raise an exception" do
      expect { Fuji::Renderer.render(OpenStruct.new) }.to raise_error("Unimplemented")
    end
  end

  # Private method
  describe "#logged_in" do
    it "returns false when there is no heroku session" do
      request = OpenStruct.new(cookies: {})
      renderer = Fuji::Renderer.new(request)
      
      renderer.send(:logged_in?).should == false
    end

    it "returns a truthy value when heroku session present" do
      request = OpenStruct.new(cookies: {"heroku_session" => 1})
      renderer = Fuji::Renderer.new(request)

      renderer.send(:logged_in?).should_not == false
      renderer.send(:logged_in?).should_not == nil
    end
  end

  # Private method
  describe "#current_page" do
    it "returns the current url from the request object" do
      url = "http://example.com"
      request = OpenStruct.new(url: url)
      renderer = Fuji::Renderer.new(request)

      renderer.send(:current_page).should == url
    end
  end
end