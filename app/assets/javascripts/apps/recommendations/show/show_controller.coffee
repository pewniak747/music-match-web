Musicmatch.module "RecommendationsApp.Show", (Show, App, Backbone, Marionette, $, _) ->
  class Show.Controller extends Marionette.Controller
    show: ->
      App.vent.trigger('navigated', 'recommendations')
      recommendations = App.request('entities:recommendations')
      @options.region.show(@getShowView(recommendations))
      recommendations.fetch()

    getShowView: (collection)->
      view = new Show.Recommendations(collection: collection)
      view.on 'refresh', ->
        request = App.request('entities:recommendation')
        request.save()
      view

  class Show.Router extends Marionette.AppRouter
    appRoutes:
      "recommendations": "show"

  App.addInitializer ->
    new Show.Router
      controller: new Show.Controller(region: App.mainRegion)
