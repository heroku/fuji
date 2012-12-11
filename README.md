Fuji
====

Fuji is a ruby gem for rendering and styling Heroku's global header and nav.

Its only dependencies are Sass and Compass, so you can use it with Rails or Sinatra.

Usage
-----

Add fuji to your application's Gemfile:

```ruby
gem 'fuji'
```

Render the header in your application layout:

```haml
= Fuji::Header.render
```

The render method accepts the following options:

```ruby
{
  user: nil,
  logo_text: "heroku",
  logo_subtext: nil
  logo_url: "https://www.heroku.com",
  login_path: nil,
  logout_path: nil,
  gravatar_fallback_url: "http://assets.heroku.com.s3.amazonaws.com/addons.heroku.com/gravatar_default.png",
}
```

Here's how it's done in addons:

```haml
= Fuji::Header.render(user: current_user, logo_subtext: "addons", login_path: login_path, logout_path: logout_path)
```

Style it up by importing the fuji partial into your sass/scss stylesheet:

```sass
// Override the defaults if you wish:
$fuji-foreground-color: #FFF
$fuji-text-color: rgba(#FFF, 1)
$fuji-highlight-color: #aed582
$fuji-max-width: 960px
$fuji-logo-text-color: rgba($fuji-highlight_color, 0.4)
$fuji-logo-subtext-color: rgba($fuji-highlight_color, 0.7)

@import "fuji"
```

## Contributing

See CONTRIBUTING.md

## License

MIT. Go nuts.