require 'spec_helper'
require 'digest/md5'

describe Fuji::Header do

  describe "#render" do
    before do
      @user = OpenStruct.new(email: "bob@heroku.com")
    end

    it "outputs an HTML string" do
      Fuji::Header.render.should match /div id='fuji'/
    end

    it "renders the user's avatar" do
      h = Fuji::Header.render(user: @user)
      hash = Digest::MD5.hexdigest(@user.email)
      h.should match /#{hash}/
    end

  end

  describe "Fuji::Helper.current_site_matches?" do

    describe "inside a rails app" do
      before do
        @request = OpenStruct.new(protocol: "https://", host_with_port: "dhh.com", fullpath: "/foo")
      end

      it "detects search string" do
        Fuji::Helper.current_site_matches?('dhh.com/foo', @request).should == true
      end

      it "doesn't detect search string" do
        Fuji::Helper.current_site_matches?('some other shit', @request).should == false
      end

    end

    describe "inside a sinatra app" do

      before do
        @request = OpenStruct.new(url: "https://mizerany.com")
      end

      it "detects search string" do
        Fuji::Helper.current_site_matches?('mizerany', @request).should == true
      end

      it "doesn't detect search string" do
        Fuji::Helper.current_site_matches?('some other blake', @request).should == false
      end

    end

    describe "in any kind of ruby app" do

      before do
        @request = OpenStruct.new(url: "https://the-rest.com")
      end

      it "allows a symbol as a search string" do
        Fuji::Helper.current_site_matches?(:rest, @request).should == true
      end

      it "matches against domain name when given a full URL" do
        Fuji::Helper.current_site_matches?("http://the-rest.com/extra/mojo", @request).should == true
      end

      it "returns false if request object is nil" do
        Fuji::Helper.current_site_matches?('foo').should == false
      end

    end

  end

  describe "extract_domain" do

    it "pulls the domain out of a URL string" do
      Fuji::Helper.extract_domain("https://dweeb-fest.example.com/sho/biz").should == "dweeb-fest.example.com"
    end

    it "returns the original string if it doesn't contain a domain" do
      Fuji::Helper.extract_domain("turkey jerky").should == "turkey jerky"
    end

  end

end
