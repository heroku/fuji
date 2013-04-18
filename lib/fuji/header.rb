class Fuji
  class Header < Renderer
    
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

    def _render
      # Choose proper link set
      links = logged_in? ? LOGGED_IN : LOGGED_OUT

      # Build HTML from link objects
      links = links.map{|l| l.html(current_page) }.join("\n")

      # Build HTML wrapper
      out = "
        <div id='fuji' class='fuji'>
          <div class='fuji-container'>
            <h1 class='fuji-brand'>
              <a class='fuji-logo' href='#{Fuji.options[:logo_url]}'>
                #{Fuji.options[:logo_text]} <span class='fuji-logo-subtext'>#{Fuji.options[:logo_subtext]}</span>
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