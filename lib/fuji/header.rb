class Fuji
  class Header

    ADDONS = Link.new("Add-ons", "https://addons.heroku.com")
    DOCUMENTATION = Link.new("Documentation", "https://devcenter.heroku.com")
    HELP = Link.new("Help & Support", "https://help.heroku.com", {css: "help"})

    LOGGED_IN = [
      Link.new("Apps", "https://dashboard.heroku.com"),
      ADDONS,
      DOCUMENTATION,
      HELP,
      Link.new("Account", "https://dashboard.heroku.com/account"),
      Link.new("Log Out", "https://id.heroku.com/logout")
    ]

    LOGGED_OUT = [
      Link.new("Sign Up", "https://www.heroku.com/signup"),
      Link.new("Pricing", "https://www.heroku.com/pricing"),
      Link.new("How it Works", "https://www.heroku.com/how"),
      ADDONS,
      DOCUMENTATION,
      HELP,
      Link.new("Login", "https://id.heroku.com/login")
    ]

    def self.render(options={})
      # Options
      options[:gravatar_fallback_url] ||= "https://s3.amazonaws.com/assets.heroku.com/addons.heroku.com/gravatar_default.png"
      options[:logo_text] ||= "heroku"
      options[:logo_subtext] ||= nil
      options[:logo_url] ||= "https://www.heroku.com"
      options[:user] ||= nil

      links = Fuji.logged_in? ? LOGGED_IN : LOGGED_OUT

      # Build HTML from link objects
      links = links.map{|l| l.html(options[:local]) }.join("\n")

      # Build HTML wrapper
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

  end
end