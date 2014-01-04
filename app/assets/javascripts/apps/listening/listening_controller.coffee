Musicmatch.module "ListeningApp", (ListeningApp, App, Backbone, Marionette, $, _) ->
  class ListeningApp.Controller extends Marionette.Controller
    search: ->
      App.vent.trigger('navigated', 'listening')
      controller = new ListeningApp.Search.Controller(region: App.mainRegion)
      controller.search()

  class ListeningApp.Router extends Marionette.AppRouter
    appRoutes:
      "listening": "search"

  App.addInitializer ->
    router = new ListeningApp.Router
      controller: new ListeningApp.Controller
    App.vent.on 'login', ->
      router.navigate('listening', trigger: true)
