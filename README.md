Fuji
====

[![Build Status](https://travis-ci.org/heroku/fuji.png?branch=master)](https://travis-ci.org/heroku/fuji)

Fuji is a ruby gem for rendering and styling Heroku's global header and nav.

Its only dependencies are Sass and Compass, so you can use it with Rails or Sinatra.

Usage
-----

Add fuji to your application's Gemfile:

```ruby
gem 'fuji'
```

```erb
<%= Fuji::Header.render %>
```

The render method accepts a hash of options with the following defaults:

```ruby
{
  user: nil,                              # if present, show gravatar
  logo_text: "heroku",
  logo_subtext: nil,                      # e.g 'dashboard' or 'add-ons'
  logo_url: "https://www.heroku.com",
  gravatar_fallback_url: "http://assets.heroku.com.s3.amazonaws.com/addons.heroku.com/gravatar_default.png"
}
```

Style it up by importing the fuji partial into your Sass/SCSS stylesheet:

```sass
// Override the defaults as desired:
$fuji-foreground-color: #8B8BB2
$fuji-background-color: transparent

$fuji-max-width: 1032px
$fuji-horizontal-padding: 12px
$fuji-vertical-padding: 2em

$fuji-logo-text-color: $fuji-foreground-color
$fuji-logo-subtext-color: rgba($fuji-foreground-color, 0.6)

$fuji-link-color-inactive: #7C76B8
$fuji-link-color-active: #1B1B24

$fuji-link-background-color-inactive: transparent
$fuji-link-background-color-active: $fuji-link-color-inactive

$fuji-base-font-size: inherit
$fuji-logo-font-size: 1.71em

$fuji-border-radius: 3px

@import "fuji"
```

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md).

## License

MIT. Go nuts. See [LICENSE](LICENSE).
