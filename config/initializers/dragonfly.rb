require 'dragonfly'

# Configure
Dragonfly.app.configure do
  plugin :imagemagick

  secret "<%= Rails.application.secrets.dragonfly_secret %>"

  url_format "/media/:job/:name"

  if Rails.env.development? || Rails.env.test?
    datastore :file,
              root_path: Rails.root.join('public/system/dragonfly', Rails.env),
              server_root: Rails.root.join('public')
  else
    datastore :s3,
              bucket_name: ENV['AWS_BUCKET'],
              access_key_id: ENV['AWS_ACCESS_KEY_ID'],
              secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
              region: ENV['AWS_REGION']
              #url_scheme: 'https'
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
end
