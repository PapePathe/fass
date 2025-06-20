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

#### Fass Api Usage

```ruby
response = GithubApi.users('PapePathe').events.get
```

```bash
  GET https://api.github.com/PapePathe/events, headers: ....
```

#### Response

```json
[
  {
    "id"=>"50925011814",
    "type"=>"CreateEvent",
    "actor"=>
     {
        "id"=>340927,
        "login"=>"PapePathe",
        "display_login"=>"PapePathe",
        "gravatar_id"=>"",
        "url"=>"https://api.github.com/users/PapePathe",
        "avatar_url"=>"https://avatars.githubusercontent.com/u/340927?"
     },
    "repo"=>{"id"=>1002602076, "name"=>"PapePathe/fass", "url"=>"https://api.github.com/repos/PapePathe/fass"},
    "payload"=>
     {"ref"=>"master", "ref_type"=>"branch", "master_branch"=>"main", "description"=>" rapid api client", "pusher_type"=>"user"},
    "public"=>true,
    "created_at"=>"2025-06-15T20:13:10Z"
  }
]
```

### Post request

### Put request

### Delete request

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bundle exec rspec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/PapePathe/fass.
