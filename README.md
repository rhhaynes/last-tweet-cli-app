# LastTweet

Ruby gem that displays the most recent tweet from all specified Twitter handles.

Before prompting for user input, a list of the five most popular Twitter accounts is provided based on http://friendorfollow.com/twitter/most-followers/.

For each Twitter handle specified, the latest tweet is displayed by scraping [https://twitter.com/](https://twitter.com/)handle.

## Usage

Run `last_tweet` after installing the gem.

### Example

```ruby
require 'last_tweet'

last_tweet
```
```diff
Please specify one or more Twitter handles to see their most recent tweet.
Sample format 1: @twitter_handle
Sample format 2: @twitter_handle1, @twitter_handle2, etc.

If interested the 5 most popular accounts are listed below.
- 1: KATY PERRY - @katyperry
- 2: Justin Bieber - @justinbieber
- 3: Barack Obama - @BarackObama
- 4: Rihanna - @rihanna
- 5: Taylor Swift - @taylorswift13

Whose tweet(s) would you like to see?  Enter exit when finished.
+ @taylorswift13
- @taylorswift13 at 2:24 PM - 5 Feb 2018
- Taylor Swift: The old Taylor can't come to the phone right now.
- Songs I’m loving right now http://Taylor.lk/SongsTaylorLoves …

Whose tweet(s) would you like to see next?  Enter exit when finished.
+ @SpaceX, @elonmusk
- @SpaceX at 7:46 PM - 6 Feb 2018
- SpaceX: SpaceX designs, manufactures and launches the world’s most advanced rockets and spacecraft.
- Third burn successful. Exceeded Mars orbit and kept going to the Asteroid Belt.pic.twitter.com/bKhRN73WHF

- @elonmusk at 2:01 PM - 7 Feb 2018
- Elon Musk
- Last pic of Starman in Roadster on its journey to Mars orbit and then the Asteroid Belt https://www.instagram.com/p/Be6VZEzgAEk/

Whose tweet(s) would you like to see next?  Enter exit when finished.
+ exit
- Goodbye!
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'last_tweet'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install last_tweet

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/'rhhaynes'/last_tweet. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the LastTweet project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/'rhhaynes'/last_tweet/blob/master/CODE_OF_CONDUCT.md).
