Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, ENV['GOOGLE_CLIENT_ID'], ENV['GOOGLE_CLIENT_SECRET']

  #provider_ignores_state => true

  provider :github, ENV['github_client_id'], ENV['github_client_secret']
end
