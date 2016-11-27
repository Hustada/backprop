OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, 117477670965-kjlkcu3516utvtv3m0vsq6a9fufj24jh.apps.googleusercontent.com, TDkKof3RzIuXm_il8QR7wBR3, {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end