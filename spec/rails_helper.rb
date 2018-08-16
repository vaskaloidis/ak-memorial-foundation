# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'simplecov'
SimpleCov.start 'rails'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails' # Rails is now loaded. Require everything else only below
Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }
ActiveRecord::Migration.maintain_test_schema!
# Shoulda::Matchers.configure do |config|
#   config.integrate do |with|
#     with.test_framework :rspec
#     with.library :active_record
#     with.library :active_model
#     # with.library :action_controller
#   end
# end
RSpec.configure do |config|
  config.use_transactional_fixtures = true
  config.infer_spec_type_from_file_location!
  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
  # # Make shoulda-matcher behave as a good rspec citizen
  # config.include(Shoulda::Matchers::ActiveModel, { type: :model, file_path: /spec\/models/})
  # config.include(Shoulda::Matchers::ActiveRecord, { type: :model, file_path: /spec\/models/})
  # config.include(Shoulda::Matchers::ActionController, { type: :model, file_path: /spec\/controllers/})
end
