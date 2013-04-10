source 'https://rubygems.org'

ruby '2.0.0'

gem 'rails', '3.2.13'

gem 'rack-status'

gem 'airbrake'
gem 'newrelic_rpm'

# Databases
gem 'mongoid'

group :staging, :production do
  gem 'unicorn'
  gem 'lograge'
end

group :development do
  # Guard
  gem 'ruby_gntp'
  gem 'rb-fsevent'

  gem 'guard-pow'
  gem 'guard-rspec'
end

group :development, :test do
  gem 'rspec-rails'
end

group :test do
  gem 'database_cleaner'
  gem 'shoulda-matchers'
end
