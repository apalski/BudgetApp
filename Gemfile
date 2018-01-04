# frozen_string_literal: true

source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

ruby '2.4.1'

gem 'bcrypt'
gem 'delayed_job_active_record'
gem 'honeybadger'
gem 'jquery-rails'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'pg'
gem 'puma'
gem 'rails', '~> 5.1.3'
gem 'sass-rails', '~> 5.0'
gem 'simple_form'
gem 'sprockets', '>= 3.0.0'
gem 'suspenders'
gem 'title'
gem 'uglifier'

group :development do
  gem 'listen'
  gem 'rack-mini-profiler', require: false
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'web-console'
end

group :development, :test do
  gem 'awesome_print'
  gem 'bullet'
  gem 'bundler-audit', '>= 0.5.0', require: false
  gem 'capybara-webkit'
  gem 'dotenv-rails'
  gem 'factory_bot_rails'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.7'
  gem 'rubocop', '~> 0.52.1', require: false
end

group :test do
  gem 'database_cleaner'
  gem 'formulaic'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'simplecov', require: false
  gem 'timecop'
  gem 'webmock'
end

group :production do
  gem 'rack-timeout'
end
