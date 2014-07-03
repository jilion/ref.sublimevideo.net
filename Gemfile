source 'https://rubygems.org'

ruby '2.1.2'

gem 'rails', '4.0.8'

gem 'pg'
gem 'oj'

gem 'honeybadger'
gem 'newrelic_rpm'
gem 'rack-status'
gem 'librato-rails'

group :production do
  gem 'unicorn'
  gem 'lograge'
end

group :development, :test do
  gem 'rspec-rails'
  gem 'dotenv-rails'
end

group :development do
  gem 'annotate'

  # Guard
  gem 'ruby_gntp'
  gem 'guard-pow'
  gem 'guard-rspec'
end

group :test do
  gem 'rspec'
  gem 'shoulda-matchers'
end
