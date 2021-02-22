source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

# Core
ruby '2.6.5'
gem 'rails', '~> 5.2.4'
# Config
gem 'dotenv-rails'
gem 'bootsnap', '>= 1.1.0', require: false
# Middleware
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
# View/Front
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
# Backend
gem 'jbuilder', '~> 2.5'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'pry-rails'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'spring'
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
  gem 'factory_bot_rails'
  gem 'launchy'
  # capistranoのツール一式
  gem 'capistrano', '3.6.0'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano3-unicorn'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'bcrypt', '3.1.11'
gem 'carrierwave'
gem 'mini_magick'
gem 'rspotify'
gem 'kaminari'
gem 'faker'
gem 'fog-aws'
gem 'unicorn'
gem 'mini_racer', platforms: :ruby