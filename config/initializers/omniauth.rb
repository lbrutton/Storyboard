Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '781067431924273', '48779e89763f9b2942ee8a8fdaf8edde'
end