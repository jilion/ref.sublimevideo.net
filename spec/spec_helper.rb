ENV["RAILS_ENV"] ||= 'test'

require_relative "../config/environment"
require 'rspec/rails'
require 'shoulda-matchers'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

ActiveRecord::Migration.check_pending!

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.use_transactional_fixtures = true
  config.filter_run_including focus: ENV['FOCUS'] != 'false'
  config.mock_with :rspec
  config.fail_fast = ENV['FAST_FAIL'] != 'false'
  config.order = ENV['ORDER'] || 'random'
end
