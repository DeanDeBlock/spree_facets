require 'simplecov'
SimpleCov.start 'rails'

ENV['RAILS_ENV'] ||= 'test'

begin
  require File.expand_path('../dummy/config/environment', __FILE__)
rescue LoadError
  puts 'Could not load dummy application. Please ensure you have run `bundle exec rake test_app`'
  exit
end

require 'rspec/rails'
require 'ffaker'
require 'shoulda-matchers'
require 'pry'
require 'webdrivers'
require 'spree/api/testing_support/caching'
require 'spree/api/testing_support/helpers'
require 'spree/api/testing_support/setup'
require 'spree/api/testing_support/v2/base'
require 'spree/api/testing_support/v2/current_order'

Dir[File.join(File.dirname(__FILE__), 'support/**/*.rb')].each { |file| require file }

RSpec.configure do |config|
  config.infer_spec_type_from_file_location!
  config.raise_errors_for_deprecations!
  config.mock_with :rspec
  config.use_transactional_fixtures = false
  config.fail_fast = false
  config.filter_run focus: true
  config.run_all_when_everything_filtered = true

  config.include Spree::Api::TestingSupport::Helpers, type: :request

  config.expect_with :rspec do |expectations|
    expectations.syntax = :expect
  end

  config.before(:each) do
    create(:store)
  end

  config.include Requests::JsonHelpers, type: :request
end