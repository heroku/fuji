require 'spec_helper'

describe Fuji::Link do

  describe "#html" do
    it "builds a link tag with default options" do
      link = Fuji::Link.new("My Link", "http://example.com")
      html = link.html

      html.should match "a href='http://example.com'"
    end
  end

  describe "#current_page" do
    it "sets no class when the link doesn't match the current URL" do
      link = Fuji::Link.new("My Link", "http://example.com")
      html = link.html("http://notamatch.com")

      html.should_not match /active/
    end

    describe "url is domain only" do
      before do
        @link = Fuji::Link.new("My Link", "http://example.com")
      end

      it "matches the current url when it is domain only" do
        html = @link.html("http://example.com")
        html.should match /active/
      end

      it "matches the current url when it includes a path" do
        html = @link.html("http://example.com/path")
        html.should match /active/
      end

      it "matches the current url when it includes a query" do
        html = @link.html("http://example.com/path?query")
        html.should match /active/
      end
    end

    describe "url includes a path" do
      before do
        @link = Fuji::Link.new("My Link", "http://example.com/path")
      end

      it "does not match the current url when it is domain only" do
        html = @link.html("http://example.com")
        html.should_not match /active/
      end

      it "matches the current url when it includes a path" do
        html = @link.html("http://example.com/path")
        html.should match /active/
      end

      it "matches the current url when it includes a query" do
        html = @link.html("http://example.com/path?query")
        html.should match /active/
      end
    end

    describe "url includes a query" do
      before do
        @link = Fuji::Link.new("My Link", "http://example.com/path?query")
      end

      it "does not match the current url when it is domain only" do
        html = @link.html("http://example.com")
        html.should_not match /active/
      end

      it "does not match the current url when it includes a path" do
        html = @link.html("http://example.com/path")
        html.should_not match /active/
      end

      it "matches the current url when it includes a query" do
        html = @link.html("http://example.com/path?query")
        html.should match /active/
      end
    end
  end

  describe "#mapping" do
    it "does nothing :map option is not set" do
      link = Fuji::Link.new("My Link", "http://example.com")
      html = link.html

      html.should match "http://example.com"
      html.should_not match "http://mapexample.com"
    end

    it "substitutes the requested URL when :map option set" do
      Fuji.options = {map: {from: "example.com", to: "mapexample.com"}}
      link = Fuji::Link.new("My Link", "http://example.com")
      html = link.html

      html.should_not match "http://example.com"
      html.should match "http://mapexample.com"
    end
  end

end