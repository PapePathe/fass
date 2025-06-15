# frozen_string_literal: true

source "https://rubygems.org"

gemspec

gem "faraday", "~> 2.13"
gem "irb"
gem "rake", "~> 13.0"

group :development, :test do
  gem "rubocop", "~> 1.21"
end

group :test do
  gem "debug"
  gem "rspec", "~> 3.0"
  gem "webmock"
end

gem "rubocop-rake", "~> 0.7.1", group: :development
gem "rubocop-rspec", "~> 3.6", group: :development
