class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session

  before_action :initialize_gon

  private

  def initialize_gon
    gon.api_url = api_url
    gon.oauth2 = oauth2_data
  end

  def oauth2_data
    {
      client_id: ENV["OAUTH2_CLIENT_ID"] || "clientid",
      client_secret: ENV["OAUTH2_CLIENT_SECRET"] || "clientsecret",
      access_url: "#{api_url}/oauth2/authorize"
    }
  end

  def api_url
    ENV["API_URL"] || "http://localhost:9000"
  end
end
