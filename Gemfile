# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.4.3"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 5.1.4"
# Use Puma as the app server
gem "puma", "~> 3.7"
# Use SCSS for stylesheets
gem "sass-rails", "~> 5.0"

gem "coffee-rails", "~> 4.2"
gem "mysql2"
gem "turbolinks", "~> 5"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "autodoc"
  gem "bullet"
  gem "byebug", platforms: %i[mri mingw x64_mingw]
  gem "database_cleaner"
  gem "dotenv-rails"
  gem "factory_girl_rails"
  gem "faker"
  gem "pry-rails"
  gem "rspec-rails"
  gem "shoulda-matchers"
  gem "webmock"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "web-console", ">= 3.3.0"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"

  gem "capistrano",         require: false
  gem "capistrano-bundler", require: false
  gem "capistrano-rails",   require: false
  gem "capistrano-rvm",     require: false
  gem "capistrano3-puma",   require: false
end

gem "active_model_serializers"
gem "activerecord-import", "~> 0.15.0"
gem "carrierwave"
gem "config"
gem "fog-aws"
gem "jquery-ui-rails"
gem "kaminari"
gem "mini_magick"
gem "roo"
gem "weak_parameters"
gem "whenever", require: false
