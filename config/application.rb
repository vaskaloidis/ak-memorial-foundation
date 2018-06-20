require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

unless Rails.env.production?
  Dotenv::Railtie.load
end

require 'money'
require 'stripe'

module AkMemorialFoundation
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1

    config.action_mailer.perform_deliveries = true # Set it to false to disable the email in dev mode
    config.action_mailer.raise_delivery_errors = true
    config.action_mailer.delivery_method = :smtp

    config.generators do |g|
      g.fixture_replacement :factory_girl
    g.test_framework :rspec,
                     :fixtures => true,
                     :view_specs => false,
                     :helper_specs => false,
                     :routing_specs => false,
                     :controller_specs => true,
                     :request_specs => true
    end

    ActionMailer::Base.smtp_settings = {
        :address => "smtp.gmail.com",
        :port => 587,
        :authentication => :plain,
        :domain => 'gmail.com',
        :user_name => ENV['GMAIL_EMAIL'],
        :password => ENV['GMAIL_PASSWORD']
    }

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.

    require 'money'
  end
end
