require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

# fcd1, 10/10/19: I need to change the module to Amesa, to follow the CUL
# convention of not having Ldpd anywhere in the app. For now, keep it till I
# get everything. When it is changed, will need to check code for other occurence,
# including in the Devise initializer, config/initializers/devise.rb
module LdpdAmesa
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Columbia CAS / omniauth
    include Cul::Omniauth::FileConfigurable

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
