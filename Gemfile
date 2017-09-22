source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

ruby "2.4.1"

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "rails", "~> 5.1.4"
# Use Puma as the app server
gem "puma", "~> 3.7"
# Use SCSS for stylesheets
gem "sass-rails", "~> 5.0"

gem "coffee-rails", "~> 4.2"
gem "turbolinks", "~> 5"
gem "mysql2"

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "rspec-rails"
  gem "factory_girl_rails"
  gem "shoulda-matchers"
  gem "faker"
  gem "database_cleaner"
  gem "pry-rails"
  gem "dotenv-rails"
  gem "bullet"
  gem "webmock"
  gem "autodoc"
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem "web-console", ">= 3.3.0"
  gem "listen", ">= 3.0.5", "< 3.2"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"

  gem "capistrano",         require: false
  gem "capistrano-rvm",     require: false
  gem "capistrano-rails",   require: false
  gem "capistrano-bundler", require: false
  gem "capistrano3-puma",   require: false
end

gem "active_model_serializers"
gem "weak_parameters"
gem "kaminari"
gem "carrierwave"
gem "fog-aws"
gem "mini_magick"
gem "whenever", :require => false
gem "config"
gem "jquery-ui-rails"
gem "roo"
gem "activerecord-import", "~> 0.15.0"
