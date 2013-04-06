require 'fuji/version'
require 'digest/md5'
require 'uri'
require 'compass'

module Fuji

  def self.render
    ::Header.render
  end

  # This makes a sass partial available to your app: @import "fuji"
  class Style

    base_directory  = File.join(File.dirname(__FILE__), '..')
    Compass::Frameworks.register('fuji', :path => base_directory)

  end

  class Header

    def self.render(options={})

      # Options
      options[:gravatar_fallback_url] ||= "https://s3.amazonaws.com/assets.heroku.com/addons.heroku.com/gravatar_default.png"
      options[:logo_text] ||= "heroku"
      options[:logo_subtext] ||= nil
      options[:logo_url] ||= "https://www.heroku.com"
      options[:user] ||= nil
      options[:links] ||= nil

      # Allow links to be overridden entirely
      links = options[:links]

      if links.nil?
        links = [
          {id: :apps, name: 'Apps', url: 'https://dashboard.heroku.com'},
          {id: :addons, name: 'Add-ons', url: 'https://addons.heroku.com'},
          {id: :documentation, name: 'Documentation', url: 'https://devcenter.heroku.com'},
          {id: :support, name: 'Support', url: 'https://help.heroku.com'},
          {id: :blog, name: 'Blog', url: 'https://blog.heroku.com'},
          {id: :account, name: 'Account', url: "https://dashboard.heroku.com/account"}
        ]

        # Gravatar
        if options[:user] && options[:user].email
          gravatar_url = [
            "https://secure.gravatar.com/avatar/",
            Digest::MD5.hexdigest(options[:user].email),
            "?default=",
            URI.escape(options[:gravatar_fallback_url])
          ].join("")
          links << {
            id: :gravatar,
            name: Fuji::Helper.image_tag(gravatar_url),
            url: 'https://dashboard.heroku.com/account'
          }
        end
      end

      # Join links together
      links = links.map do |link|
        Fuji::Helper.link_to(link[:name], link[:url], link[:id])
      end.join("\n")

      # Prepare the HTML output
      out = "
        <div id='fuji' class='fuji'>
          <div class='fuji-container'>
            <h1 class='fuji-brand'>
              <a class='fuji-logo' href='#{options[:logo_url]}'>
                #{options[:logo_text]} <span class='fuji-logo-subtext'>#{options[:logo_subtext]}</span>
              </a>
            </h1>

            <ul class='fuji-links'>#{links}</ul>
          </div>
        </div>
      "

      # If we're in Rails, make it HTML safe
      out.respond_to?(:html_safe) ? out.html_safe : out
    end

    # def self.default_links(options={})
    # end

  end

  class Helper

    def self.current_site_matches?(search_string_or_url, request_object=nil)
      # Allow request object to be mocked, for testing purposes
      request ||= request_object
      return false unless request

      # Clean the string up
      q = extract_domain(search_string_or_url).to_s

      return true if request.url && request.url.include?(q)
      return true if request.host_with_port && request.host_with_port.include?(q)
      false
    end

    def self.extract_domain(string)
      string =~ (/^(?:\w+:\/\/)?([^\/?]+)(?:\/|\?|$)/) ? $1 : string
    end

    def self.link_to(name, url, css="")
      css << " active" if Fuji::Helper.current_site_matches?(url)
      "<li><a href='#{url}' class='#{css}'>#{name}</a></li>"
    end

    def self.image_tag(url)
      "<img src='#{url}'>"
    end

  end

end
