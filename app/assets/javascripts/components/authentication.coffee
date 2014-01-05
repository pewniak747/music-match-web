Musicmatch.module "Components.Authentication", (Authentication, App, Backbone, Marionette, $, _) ->
  App.addInitializer ->
    Authentication.oauth2 = new Backbone.OAuth2
      clientId: gon.oauth2.client_id,
      clientSecret: gon.oauth2.client_secret,
      accessUrl: gon.oauth2.access_url
