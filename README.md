Fuji
====

Fuji is a ruby gem for rendering and styling Heroku's global header and nav.

The only dependencies are Sass and Compass, so you can use it with Rails or Sinatra.

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
  gravatar_default: "http://assets.heroku.com.s3.amazonaws.com/addons.heroku.com/gravatar_default.png",
  logo_text: "heroku",
  logo_url: "https://www.heroku.com",
  user: nil,
  login_path: nil,
  logout_path: nil,
}
```

Style it up by importing the fuji partial into your main sass/scss stylesheet

```sass
// Override defaults if you wish:
$fuji-foreground-color: #FFF
$fuji-text-color: rgba(#FFF, 1)
$fuji-highlight-color: #FFF
$fuji-max-width: 960px

@import "fuji"
```

## Contributing

See CONTRIBUTING.md

## License

MIT. Go nuts.