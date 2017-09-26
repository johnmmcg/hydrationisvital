source 'https://rubygems.org/'
ruby '2.3.3'

gem 'rails', '5.0.0.1'
gem 'pg', '~> 0.15'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'jquery-rails'
gem 'listen'
gem 'devise'
gem 'carrierwave', '~> 1.0'
gem 'fog-aws'
gem 'foundation-rails'
gem 'faker'

group :development, :test do
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'rspec-rails', '~> 3.0'
  gem 'pry-rails'
  gem 'shoulda'
  gem 'valid_attribute'
  gem 'dotenv-rails'
  gem 'phantomjs', :require => 'phantomjs/poltergeist'
  gem 'poltergeist'
end

group :test do
  gem 'launchy', require: false
  gem "capybara-screenshot"
  gem "chromedriver-helper"
  gem "database_cleaner"
  gem "generator_spec"
  gem "rspec-retry"
  gem 'selenium-webdriver', '~> 3.0'
end

group :production do
  gem 'rails_12factor'
end
