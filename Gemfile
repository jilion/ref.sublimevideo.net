source 'https://rubygems.org'

gem 'rails', '3.2.2'

# Internals
gem 'airbrake', '~> 3.0.5'

# Databases
gem 'bson_ext', '~> 1.6.0'
gem 'bson',     '~> 1.6.0'
gem 'mongo',    '~> 1.6.0'
gem 'mongoid',  '~> 2.4.7'

group :production do
  gem 'thin'
end

group :staging, :production do
  gem 'newrelic_rpm'
  gem 'rpm_contrib'
end

group :development, :test do
  gem 'rspec-rails'
end

group :test do
  gem 'database_cleaner'
  gem 'shoulda-matchers'
end

group :tools do
  gem 'heroku'
  gem 'foreman'
  gem 'powder'
  gem 'pry'

  # Guard
  gem 'growl'
  platforms :ruby do
    gem 'rb-readline'
  end

  gem 'guard-pow'
  gem 'guard-rspec'
end
