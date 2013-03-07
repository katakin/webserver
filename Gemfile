source 'https://rubygems.org'

ruby '1.9.3'
gem 'rails', '~> 3.2.12'
gem 'jquery-rails'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end

group :production do
  gem "thin", ">= 1.5.0"
end

group :test do
  gem "database_cleaner", ">= 0.9.1"
  gem "email_spec", ">= 1.4.0"
  gem "mongoid-rspec", ">= 1.6.0"
  gem "cucumber-rails", ">= 1.3.0", :require => false
  gem "launchy", ">= 2.1.2"
	gem "capybara", ">= 2.0.2"
end

group :development do
  gem "quiet_assets", ">= 1.0.1"
	gem "better_errors", ">= 0.3.2"
	gem "binding_of_caller", ">= 0.6.8"
end

group :development, :test do
  gem "factory_girl_rails", ">= 4.2.0"
  gem "rspec-rails", ">= 2.12.2"
end

gem "mongoid", ">= 3.0.19"
gem "cancan", ">= 1.6.8"
gem "rolify", ">= 3.2.0"
gem "bootstrap-sass", ">= 2.3.0.0"
gem "simple_form", ">= 2.0.4"

gem "figaro", ">= 0.5.3"
gem "devise", ">= 2.2.3"

gem 'oj'
gem 'nokogiri'
# gem 'whenever', :require => false