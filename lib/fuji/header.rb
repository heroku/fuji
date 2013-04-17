class Fuji
  class Header

    LOGGED_IN = [
      {id: :apps, name: 'Apps', url: 'https://dashboard.heroku.com'},
      {id: :addons, name: 'Add-ons', url: 'https://addons.heroku.com'},
      {id: :documentation, name: 'Documentation', url: 'https://devcenter.heroku.com'},
      {id: :support, name: 'Help & Support', url: 'https://help.heroku.com'},
      {id: :account, name: 'Account', url: "https://dashboard.heroku.com/account"},
      {id: :account, name: 'Log Out', url: "https://id.heroku.com/logout"}
    ]

    LOGGED_OUT = [
      {id: :signup, name: 'Sign Up', url: 'https://www.heroku.com/signup'},
      {id: :pricing, name: 'Pricing', url: 'https://www.heroku.com/pricing'},
      {id: :how, name: 'How It Works', url: 'https://www.heroku.com/how'},
      {id: :documentation, name: 'Documentation', url: 'https://devcenter.heroku.com'},
      {id: :support, name: 'Help & Support', url: 'https://help.heroku.com'},
      {id: :login, name: 'Login', url: "https://id.heroku.com/login"}
    ]

    def self.render(options={})
      # Options
      options[:gravatar_fallback_url] ||= "https://s3.amazonaws.com/assets.heroku.com/addons.heroku.com/gravatar_default.png"
      options[:logo_text] ||= "heroku"
      options[:logo_subtext] ||= nil
      options[:logo_url] ||= "https://www.heroku.com"
      options[:user] ||= nil
      options[:links] ||= nil

      # TODO: deprecate this
      # Allow links to be overridden entirely
      links = Fuji.logged_in? ? Fuji::Header::LOGGED_IN : Fuji::Header::LOGGED_OUT
      if options[:links]
        links = options[:links]
      end

      # # Gravatar
      # if options[:user] && options[:user].email
      #   gravatar_url = [
      #     "https://secure.gravatar.com/avatar/",
      #     Digest::MD5.hexdigest(options[:user].email),
      #     "?default=",
      #     URI.escape(options[:gravatar_fallback_url])
      #   ].join("")
      #   links << {
      #     id: :gravatar,
      #     name: Fuji::Helper.image_tag(gravatar_url),
      #     url: 'https://dashboard.heroku.com/account'
      #   }
      # end
      # end

      # Join links together
      links = links.map do |link|
        url = link[:url]
        url = url.sub(options[:local][:from], options[:local][:to]) if options[:local]
        Fuji::Helper.link_to(link[:name], url, link[:id])
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

  end
end