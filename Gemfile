# frozen_string_literal: true

source 'https://rubygems.org'

gem 'coffee-rails', '~> 4.2'
gem 'haml'
gem 'haml-rails'
gem 'mysql2'
gem 'rails', '~> 5.1.0'
gem 'rspec-rails'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'whenever', require: false

group :development, :test do
  gem 'capybara'
  gem 'codeclimate-test-reporter'
  gem 'factory_girl_rails'
  gem 'ffaker'
  gem 'pry-byebug'
  gem 'rack_session_access'
  gem 'rspec-html-matchers'
  gem 'rubocop'
  gem 'simplecov', require: false
  gem 'timecop'
end

group :development do
  gem 'capistrano', '~> 3.9.0', require: false
  gem 'capistrano-bundler',     require: false
  gem 'capistrano-passenger',   require: false
  gem 'capistrano-pending',     require: false
  gem 'capistrano-rails',       require: false
  gem 'capistrano-yarn',        require: false
  gem 'erb2haml'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rb-fsevent', '0.9.8'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :production do
  gem 'uglifier'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
