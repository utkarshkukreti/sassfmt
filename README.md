# Sassfmt

Sassfmt sorts properties in your .sass files according to the order defined in
Twitter's [RECESS]. (Sassfmt actually uses [scss-lint]'s updated fork available
[here][recess.txt].)

[RECESS]: https://github.com/twitter/recess
[scss-lint]: https://github.com/brigade/scss-lint
[recess.txt]: https://github.com/brigade/scss-lint/blob/fe04ca9de2d1cf1b28122fb3add7116bef995edd/data/property-sort-orders/recess.txt

## Installation

    $ gem install sassfmt

## Usage

To format a .sass file and print to stdout:

    $ sassfmt /path/to/your/style.sass

or

    $ cat /path/to/your/style.sass | sassfmt

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment. Run `bundle exec sassfmt` to use the gem in this directory, ignoring other installed copies of this gem.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/utkarshkukreti/sassfmt.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
