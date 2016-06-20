ENV['RACK_ENV'] = 'test'

require 'coveralls'
require 'simplecov'
# require 'capybara'
# require 'rspec'
require 'capybara/rspec'
require 'database_cleaner'
require_relative '../app/app'
require_relative '../app/models/post'
require_relative '../app/models/user'
require_relative './helpers/users_helper'

Capybara.app = Chitter

SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  Coveralls::SimpleCov::Formatter
]
Coveralls.wear!

RSpec.configure do |config|
  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end
  config.before(:each) do
    DatabaseCleaner.start
  end
  config.after(:each) do
    DatabaseCleaner.clean
  end
end
  