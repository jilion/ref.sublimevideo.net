require 'rubygems'

ENV["RAILS_ENV"] ||= 'test'

require File.dirname(__FILE__) + "/../config/environment"
require 'rspec/rails'

RSpec.configure do |c|
  c.treat_symbols_as_metadata_keys_with_true_values = true
  c.run_all_when_everything_filtered = true
  c.filter_run_including focus: true

  c.mock_with :rspec

  c.before(:each) do
    DatabaseCleaner.orm = "mongoid"
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
  end
end

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
