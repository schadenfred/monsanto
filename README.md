# Monsanto

Similar to Seedbank, but with automatic dependency sorting.

## Installation

Add this line to your Rails 4+ application's Gemfile:

```ruby
gem 'monsanto'
```

And then execute:

    $ bundle

## Usage

Create a directory strucure for your rake tasks that looks like this:

    /lib/tasks/populate/

Inside the populate directory, create another directory to tell Monsanto the environment you'd like to populate. If you'd like to populate your development environment, do:

    /lib/tasks/populate/development/

If your application has wine reviews, with each review belonging to both a reviewer of class "User" and a wine, and with each wine belonging to a winery, create populators for each of these models, like so:

    /lib/tasks/populate/development/users.populator.rb
    /lib/tasks/populate/development/reviews.populator.rb
    /lib/tasks/populate/development/wine.populator.rb
    /lib/tasks/populate/development/wineries.populator.rb

Use the same syntax and conventions you'd use in a standard Rails seed.rb file. Once you run rake db:populate:development, Monsanto will use ActiveRecord reflection and tsort to run them in the correct order.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/monsanto/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
