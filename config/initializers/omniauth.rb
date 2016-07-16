OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '796163203819756', '8846c0f53795957bf9a27eca3468eb6a'
end