require "akme/version"
require 'digest/md5'
require 'uri'

module Akme

  module ViewHelpers
    def akme(options={})
      
      # Options
      options[:gravatar_default] ||= "http://assets.heroku.com.s3.amazonaws.com/addons.heroku.com/gravatar_default.png"
      options[:logo_text] ||= "Heroku"
      options[:logo_url] ||= "https://www.heroku.com"
      options[:user] ||= nil
      options[:login_path] ||= nil
      options[:logout_path] ||= nil
      
      # Build link names and URLs
      links = []
      links << ['How it Works', 'https://heroku.com/how'] unless options[:user]
      links << ['Pricing', 'https://www.heroku.com/pricing'] unless options[:user]
      links << ['Apps', 'https://dashboard.heroku.com']
      links << ['Addons', 'https://addons.heroku.com']
      links << ['Dev Center', 'https://devcenter.heroku.com']
      links << ['Help', 'https://help.heroku.com']
      links << ['Logout', options[:logout_path]] if options[:user] && options[:logout_path]
      
      # Gravatar
      if options[:user] && options[:user].email
        gravatar_url = [
          "https://secure.gravatar.com/avatar/",
          Digest::MD5.hexdigest(options[:user].email),
          "?default=",
          URI.escape(options[:gravatar_default])
        ].join("")
        links << [gravatar_default, 'https://dashboard.heroku.com/account']
      end
      
      links << ['Login', options[:login_path]] if options[:login_path] && options[:current_user].nil?

      # Join links together
      links = links.map do |link|
        name, url = link
        
        # Give the link a class of 'active' if its domain matches the current URL
        css = current_site_matches?(link) ? "active" : ""
        
        "<a href='#{url}' class='#{css}'>#{name}</a>"
      end.join("\n")
      
      # Prepare the HTML output
      out = "
        <div id='akme'>
          <div class='container'>
            <h1>
              <a href='#{options[:logo_url]}'>#{options[:logo_text]}</a>
            </h1>
            <ul>#{links}</ul>
          </div>
        </div>
      "
      
      # If we're in Rails, make it HTML safe
      out.respond_to?(:html_safe) ? out.html_safe : out
    end
    
    def current_site_matches?(search_string_or_url, request_object=nil)
      # Allow request object to be mocked, for testing purposes
      request ||= request_object
      return false unless request
      
      # Clean the string up
      q = extract_domain(search_string_or_url).to_s
      
      return true if request.url && request.url.include?(q)
      return true if request.host_with_port && request.host_with_port.include?(q)
      false
    end

    def extract_domain(string)
      string =~ (/^(?:\w+:\/\/)?([^\/?]+)(?:\/|\?|$)/) ? $1 : string
    end
    
  end
  
end

ActionView::Base.send :include, Akme::ViewHelpers if defined?(ActionView)