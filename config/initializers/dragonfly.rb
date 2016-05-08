require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "<%= Rails.application.secrets.dragonfly_secret %>"
  #secret "72245c7371d66ccca6f9356779fa16e3104e6676c1e57af987e9e3f92130dca5"

  url_format "/media/:job/:name"

  datastore :file,
    root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    server_root: Rails.root.join('public')
end

# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
