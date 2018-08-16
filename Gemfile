source 'https://rubygems.org'
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end
# Athan Kaloidis Memorial Gems
ruby "2.5.1"
gem 'rails', '~> 5.1.4' # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rollbar'
gem 'stripe'
gem 'yaml_db'
gem 'devise'
gem 'pundit'
gem 'pundit-matchers', '~> 1.6.0'
gem 'money'
gem 'pg'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery'
gem 'jquery-rails'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'judge'
gem 'font-awesome-rails'
gem 'rails_12factor'
gem 'recaptcha', require: 'recaptcha/rails'
gem 'bcrypt'
gem 'discard', '~> 1.0'
group :development, :test do
  gem 'stripe-ruby-mock', '~> 2.5.4', :require => 'stripe_mock'
  gem 'bullet'
  gem 'coveralls', require: false
  # gem 'capybara-email'
  gem 'factory_bot'
  gem 'factory_bot_rails'
  gem 'faker', git: 'https://github.com/stympy/faker.git', branch: 'master'
  # gem 'capybara-email'
  gem 'dotenv-rails'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rubocop', '~> 0.56.0', require: false
  gem 'pry-rails'
  gem 'launchy'
end
group :test do
  gem 'rspec-rails'
  gem 'capybara'
  gem 'chromedriver-helper'
  gem 'database_cleaner'
  gem 'selenium-webdriver'
  # gem 'shoulda', '~> 3.5'
  # gem 'shoulda-matchers', '~> 2.0'
  gem 'simplecov', require: false
end
group :development do
  gem 'rspec-kickstarter'
  gem 'better_errors'
  # gem 'letter_opener'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
