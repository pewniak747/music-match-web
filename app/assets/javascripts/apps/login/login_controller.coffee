Musicmatch.module "LoginApp", (LoginApp, App, Backbone, Marionette, $, _) ->
  class LoginApp.Controller extends Marionette.Controller
    show: ->
      App.mainRegion.show(@getLoginView())

    getLoginView: ->
      view = new LoginApp.Login
      view.on 'submit', ->
        App.vent.trigger('login') # TODO: login process
      view

  class LoginApp.Router extends Marionette.AppRouter
    appRoutes:
      "login": "show"

  App.addInitializer ->
    controller = new LoginApp.Controller
    router = new LoginApp.Router
      controller: controller
    App.vent.on 'logout', ->
      router.navigate('login')
      controller.show()

  App.on 'initialize:after', ->
    App.vent.trigger('logout')
