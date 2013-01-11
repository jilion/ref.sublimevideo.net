source 'https://rubygems.org'

ruby '1.9.3'

gem 'rails', '3.2.11'

# Internals
gem 'airbrake'

# Databases
gem 'mongoid'

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
