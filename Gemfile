# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.0"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem "rails", "~> 6.1.3", ">= 6.1.3.1"
# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"
# Use Puma as the app server
gem "puma", "~> 5.0"
# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.4", require: false
# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

gem "concurrent-ruby", require: "concurrent"
gem "graphiql-rails"
gem "graphql"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "debase"
  gem "dotenv-rails"
  gem "factory_bot_rails"
  gem "faker"
  gem "rbs_rails", require: false
  gem "rspec-rails"
  gem "rubocop"
  gem "rubocop-rails", require: false
  gem "rubocop-rspec", require: false
  gem "ruby-debug-ide"
  gem "shoulda-matchers"
end

group :development do
  gem "guard", require: false
  gem "guard-rspec", require: false
  gem "listen", "~> 3.3"
  gem "solargraph"
  gem "steep"
end

group :test do
  gem "launchy"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]
