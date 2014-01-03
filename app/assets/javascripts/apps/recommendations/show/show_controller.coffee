Musicmatch.module "RecommendationsApp.Show", (Show, App, Backbone, Marionette, $, _) ->
  class Show.Controller extends Marionette.Controller
    show: ->
      App.vent.trigger('navigated', 'recommendations')
      recommendations = new App.Entities.Recommendations
      @options.region.show(@getShowView(recommendations))
      recommendations.fetch()

    getShowView: (collection)->
      new Show.Recommendations(collection: collection)

  class Show.Router extends Marionette.AppRouter
    appRoutes:
      "recommendations": "show"

  App.addInitializer ->
    new Show.Router
      controller: new Show.Controller(region: App.mainRegion)
