Akme
====

the ruby gem for heroku's new site header

Installation
------------

Add this line to your application's Gemfile:

    gem 'akme'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install akme
    
    
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

Usage
-----

Coming soon

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
