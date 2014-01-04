Musicmatch.module "StatisticsApp.Show", (Show, App, Backbone, Marionette, $, _) ->
  class Show.Controller extends Marionette.Controller
    show: ->
      App.vent.trigger('navigated', 'statistics')
      @options.region.show(@getShowLayout())

    getShowLayout: ->
      new Show.Layout

  class Show.Router extends Marionette.AppRouter
    appRoutes:
      "statistics": "show"

  App.addInitializer ->
    new Show.Router
      controller: new Show.Controller(region: App.mainRegion)
