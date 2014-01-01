Musicmatch.module "RecommendationsApp.Show", (Show, App, Backbone, Marionette, $, _) ->
  class Show.Controller extends Marionette.Controller
    show: ->
      App.vent.trigger('navigated', 'recommendations')
      @options.region.show(@getShowView())

    getShowView: ->
      new Show.Show

  class Show.Router extends Marionette.AppRouter
    appRoutes:
      "recommendations": "show"

  App.addInitializer ->
    new Show.Router
      controller: new Show.Controller(region: App.mainRegion)
