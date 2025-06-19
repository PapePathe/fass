# Fass

TODO: Delete this and the text below, and describe your gem

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/fass`. To experiment with that code, run `bin/console` for an interactive prompt.

## Installation

TODO: Replace `UPDATE_WITH_YOUR_GEM_NAME_IMMEDIATELY_AFTER_RELEASE_TO_RUBYGEMS_ORG` with your gem name right after releasing it to RubyGems.org. Please do not do it earlier due to security reasons. Alternatively, replace this section with instructions to install your gem from git if you don't plan to release to RubyGems.org.

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

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and the created tag, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/fass.
