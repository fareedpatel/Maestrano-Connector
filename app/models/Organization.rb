class Organization < Maestrano::Connector::Rails::Organization
  def belonging_to_omniauth(auth)
    self.oauth_uid = "baseCRM"
    self.oauth_token = auth.token
    self.refresh_token = auth.refresh_token
    self.oauth_provider = 'Base'
    self.save
  end

  def revoke_omniauth
    self.oauth_uid = nil
    self.oauth_token = nil
    self.refresh_token = nil
    self.sync_enabled = false
    self.oauth_provider = nil
    self.save
  end
end


