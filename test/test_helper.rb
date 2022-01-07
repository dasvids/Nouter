ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

require_relative 'helpers/user_helper'
ActiveRecord::FixtureSet.context_class.include UserHelper

class ActiveSupport::TestCase
  include UserHelper
  # Run tests in parallel with specified workers
  # parallelize(workers: :number_of_processors, with: :threads)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
