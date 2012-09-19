require 'spec_helper'

describe Akme do
  
  describe "akme" do
    
    it "outputs an HTML string" do
      akme.should match /div id='akme'/
    end
    
  end
  
  describe "current_site_matches?" do
        
    describe "inside a rails app" do
      before do
        @request = OpenStruct.new(protocol: "https://", host_with_port: "dhh.com", fullpath: "/foo")
      end
      
      it "detects search string" do
        current_site_matches?('dhh.com/foo', @request).should == true
      end

      
      it "doesn't detect search string" do
        current_site_matches?('some other shit', @request).should == false
      end
            
    end
    
    describe "inside a sinatra app" do

      before do
        @request = OpenStruct.new(url: "https://mizerany.com")
      end
      
      it "detects search string" do
        current_site_matches?('mizerany', @request).should == true
      end
      
      it "doesn't detect search string" do
        current_site_matches?('some other blake', @request).should == false
      end
      
    end
    
    describe "in any kind of ruby app" do
      
      before do
        @request = OpenStruct.new(url: "https://the-rest.com")
      end
      
      it "allows a symbol as a search string" do
        current_site_matches?(:rest, @request).should == true
      end
      
      it "matches against domain name when given a full URL" do
        current_site_matches?("http://the-rest.com/extra/mojo", @request).should == true
      end
      
      it "returns false if request object is nil" do
        current_site_matches?('foo').should == false
      end
      
    end
        
  end
  
  describe "extract_domain" do
    
    it "pulls the domain out of a URL string" do
      extract_domain("https://dweeb-fest.example.com/sho/biz").should == "dweeb-fest.example.com"
    end
    
    it "returns the original string if it doesn't contain a domain" do
      extract_domain("turkey jerky").should == "turkey jerky"
    end
    
  end
  
end