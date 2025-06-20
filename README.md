# Fass

Declarative api client builder using ruby meta-programming.

## Installation

Install the gem and add to the application's Gemfile by executing:

```bash
bundle add fass
```

If bundler is not being used to manage dependencies, install the gem by executing:

```bash
gem install fass
```

## Usage

Let's use the github api as an example

```ruby
GithubApi = Fass::Api.new(
  base_url: 'https://api.github.com',
  headers: {
    "Authorization": "Bearer: YOUR_TOKEN",
    "Content-Type": "application/json"
  }
)
```

### Get request

```ruby
response = GithubApi.users('PapePathe').events.get
```

```bash
curl -L \
  -H "Accept: application/json" \
  -H "Authorization: Bearer YOUR_TOKEN" \
  https://api.github.com/PapePathe/events
```

### Post request

### Put request

### Delete request

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/PapePathe/fass.
