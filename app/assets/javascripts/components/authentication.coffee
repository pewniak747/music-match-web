Musicmatch.module "Components.Authentication", (Authentication, App, Backbone, Marionette, $, _) ->
  Authentication.authenticate = (session)->
    @currentSession = session
    @oauth2.access(session.get('login'), session.get('password'))

  Authentication.authenticationSuccess = ->
    App.vent.trigger('login', @currentSession)

  Authentication.authenticationError = ->
    @currentSession?.trigger('error')

  Authentication.unauthenticate = ->
    @currentSession = null
    App.vent.trigger('logout')
    @oauth2.clear() # TODO: use revoke after implementing on API

  App.addInitializer ->
    Authentication.oauth2 = new Backbone.OAuth2
      clientId: gon.oauth2.client_id,
      clientSecret: gon.oauth2.client_secret,
      accessUrl: gon.oauth2.access_url
    Authentication.oauth2.on 'access', -> Authentication.authenticationSuccess()
    Authentication.oauth2.on 'error', -> Authentication.authenticationError()

  App.commands.setHandler 'authenticate', (session)->
    Authentication.authenticate(session)

  App.commands.setHandler 'unauthenticate', ->
    Authentication.unauthenticate()

  App.reqres.setHandler 'entities:accesstoken', ->
    Authentication.oauth2.state

  App.reqres.setHandler 'authenticated', ->
    Authentication.oauth2.isAuthenticated()
