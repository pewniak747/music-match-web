Musicmatch.module "LoginApp", (LoginApp, App, Backbone, Marionette, $, _) ->
  class LoginApp.Controller extends Marionette.Controller
    show: ->
      session = App.request("entities:session")
      App.mainRegion.show(@getLoginView(session))

    getLoginView: (session)->
      view = new LoginApp.Login(model: session)
      view.on 'submit', ->
        App.execute("authenticate", session)
      view

  class LoginApp.Router extends Marionette.AppRouter
    appRoutes:
      "login": "show"

  App.addInitializer ->
    controller = new LoginApp.Controller
    router = new LoginApp.Router
      controller: controller
    App.vent.on 'logout', ->
      router.navigate('login', trigger: true)
