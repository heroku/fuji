Akme (ακμή)
===========

Akme is the ruby gem for heroku's new site header.

Acme means "the top or highest point". The _acme_ gem name was taken, so we're rolling with the Greek variant.

Installation
------------

Add this line to your application's Gemfile:

    gem 'akme'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install akme

Usage
-----

Drop this helper in your layout:

```haml
= Akme::Header.render
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

Style it up by importing the akme partial into your main sass/scss stylesheet

```sass
// Override defaults if you wish:
$akme-foreground-color: #FFF
$akme-text-color: rgba(#FFF, 1)
$akme-highlight-color: #FFF
$akme-max-width: 960px

@import "akme"
```

Spec
----

Here's what it does so far:

    Akme
      akme
        outputs an HTML string
      current_site_matches?
        inside a rails app
          detects search string
          doesn't detect search string
        inside a sinatra app
          detects search string
          doesn't detect search string
        in any kind of ruby app
          allows a symbol as a search string
          matches against domain name when given a full URL
          returns false if request object is nil
      extract_domain
        pulls the domain out of a URL string
        returns the original string if it doesn't contain a domain

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Write tested code and make sure tests pass (`bundle exec rake spec`)
4. Commit your changes (`git commit -am 'Add a tested feature'`)
5. Push to the branch (`git push origin my-new-feature`)
6. Create new Pull Request
