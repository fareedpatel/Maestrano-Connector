require 'singleton'

class BaseClient
  include Singleton
  REDIRECT_URI = "https://a68e8c04.ngrok.io/auth/baseCRM/callback"

  def self.authorize(auth_params)
    OAuth2::Client.new(ENV['client_id'],
                       ENV['client_secret'],
                       site: "https://api.getbase.com",
                       authorize_url: "/oauth2/authorize?#{auth_params}")
  end

  def self.obtain_token
    OAuth2::Client.new(ENV['client_id'],
                       ENV['client_secret'],
                       site: "https://api.getbase.com",
                       token_url: "/oauth2/token")
  end
end