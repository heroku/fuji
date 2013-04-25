class Fuji
  class Header < Renderer

    ADDONS = Link.new("Add-ons", "https://addons.heroku.com/")
    DOCUMENTATION = Link.new("Documentation", "https://devcenter.heroku.com/")
    HELP = Link.new("Help & Support", "https://help.heroku.com/", {css: "help"})

    LOGGED_IN = [
      Link.new("Apps", "https://dashboard.heroku.com/"),
      ADDONS,
      DOCUMENTATION,
      HELP,
      Link.new("Account", "https://dashboard.heroku.com/account"),
      Link.new("Log Out", "https://id.heroku.com/logout")
    ]

    LOGGED_OUT = [
      Link.new("Sign Up", "https://www.heroku.com/signup"),
      Link.new("Pricing", "https://www.heroku.com/pricing"),
      ADDONS,
      DOCUMENTATION,
      HELP,
      Link.new("Login", "https://id.heroku.com/login")
    ]

    def render
      # Build HTML from link objects
      link_html = links.map{|l| l.html(current_page) }.join("\n")

      home = Link.new("#{Fuji.options[:logo_text]} <span class='fuji-logo-subtext'>#{Fuji.options[:logo_subtext]}</span>", Fuji.options[:logo_url], {css: "fuji-logo", skip_li: true})

      # Build HTML wrapper
      out = "
        <div class='fuji #{css_class}'>
          <div class='fuji-container'>
            <h1 class='fuji-brand'>
              #{home.html}
            </h1>

            <ul class='fuji-links'>#{link_html}</ul>
          </div>
        </div>
      "

      # If we're in Rails, make it HTML safe
      out.respond_to?(:html_safe) ? out.html_safe : out
    end

  private

    def css_class
      "fuji-header"
    end

    def links
      logged_in? ? LOGGED_IN : LOGGED_OUT
    end

  end
end