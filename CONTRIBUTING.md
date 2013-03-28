We love pull requests! Here's a quick guide:

1. Fork the repo.
1. Run the tests: `bundle && rake`
1. Hack and test.
1. Push to your fork and submit a pull request.
1. Profit.

To make life easier during development, symlink the `_fuji.sass` partial
so you don't have to repackage the gem, bundle, and restart your server every
time you make a change.

```sh
cd my-fuji-using-app
cd app/assets/stylesheets
ln -s  ~/path/to/fuji/gem/stylesheets/_fuji.sass _tmpfuji.sass
```

In your fuji-using app's stylesheet:

```sass
@import "tmpfuji"
```