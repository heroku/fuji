require 'spec_helper'

describe Fuji::Header do
  describe "chooses the correct link set when" do
    it "is logged out" do
      request = OpenStruct.new(cookies: {})
      html = Fuji::Header.render request

      html.should match "Sign Up"
      html.should_not match "Apps"
    end

    it "is logged in" do
      request = OpenStruct.new(cookies: {"heroku_session" => 1})
      html = Fuji::Header.render request

      html.should_not match "Sign Up"
      html.should match "Apps"
    end
  end

  it "passes the current page to the links" do
    request = OpenStruct.new(url: "https://www.heroku.com/pricing")
    html = Fuji::Header.render request

    html.should match "a href='https://www.heroku.com/pricing' class='pricing active'"
  end

  it "renders the logo url from options" do
    link = "http://fujiheader.com"
    Fuji.options = {logo_url: link}

    html = Fuji::Header.render OpenStruct.new
    html.should match "a href='#{link}' class='fuji-logo'"
  end

  it "renders the logo text from options" do
    text = "My Title"
    Fuji.options = {logo_text: text}

    html = Fuji::Header.render OpenStruct.new
    html.should match text
  end

  it "renders the logo subtext from options" do
    text = "My Subtitle"
    Fuji.options = {logo_subtext: text}

    html = Fuji::Header.render OpenStruct.new
    html.should match "heroku <span class='fuji-logo-subtext'>#{text}"
  end
end