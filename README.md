Fuji
====

[![Build Status](https://travis-ci.org/heroku/fuji.png?branch=master)](https://travis-ci.org/heroku/fuji)
[![Code Climate](https://codeclimate.com/github/heroku/fuji.png)](https://codeclimate.com/github/heroku/fuji)

**Do not use. This has been replaced by [fuji.js](https://github.com/heroku/fuji.js)**

Fuji is a ruby gem for rendering and styling Heroku's global header and nav.

Its only dependencies are Sass and Compass, so you can use it with Rails or Sinatra.

Usage
-----

Add fuji to your application's Gemfile:

```ruby
gem 'fuji'
```

And render a section by calling `render` and passing it the `Rack::Request` object, and any required options.

### Heroku Header

![](http://f.cl.ly/items/1k0K312k2z3B0e1w3l3z/fuji-header.png)

The Heroku header renders the default Heroku navgation, including checking whether a user is logged in or logged out.

```erb
<%= Fuji::Header.render request %>
```

### Custom Header

![](http://f.cl.ly/items/1K0r0u1E1F2b2k260R0E/fuji-custom-header.png)

The custom header allows you to specify a set of links to render instead of the default Heroku navigation. This header will make use of any information about the user's state.

```erb
<%= Fuji::CustomHeader.render request, [Fuji::Link.new("My Link", "http://example.com")] %>
```

Config
------

You can set global Fuji config options that affect all rendered sections.

### Rails

When using Rails, you can specify Fuji's config in your application's environment configuration:

```ruby
config.fuji_options = {logo_text: "heroku", logo_subtext: "dashboard"}
```

### Ruby

```ruby
Fuji.options = {logo_text: "heroku", logo_subtext: "dashboard"}
```

### Default Options

* `logo_text`: The text output first in the logo (default: "heroku")
* `logo_subtext`: Text output second in the logo e.g. 'dashboard' or 'add-ons' (default: "")
* `logo_url`: URL linked to from the logo (default: "https://www.heroku.com")
* `map`: Optional hash containing keys `:from` and `:to` which substitutes URLs in navigation with the specified `:to` string. For example:

  ```ruby
  # development.rb
  config.fuji_options = {map: {from: "https://www.heroku.com", to: "http://localhost:5000"}}
  ```

  Will modify all links to www.heroku.com to point to localhost:5000, including correctly tracking active page state on an app running locally.

## Styles

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
