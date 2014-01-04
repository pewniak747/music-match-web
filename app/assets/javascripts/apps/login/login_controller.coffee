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

  App.addInitializer ->
    router = new LoginApp.Router
    App.vent.on 'logout', ->
      controller = new LoginApp.Controller
      controller.show()
      router.navigate('')
