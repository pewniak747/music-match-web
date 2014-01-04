Musicmatch.module "StatisticsApp.Show", (Show, App, Backbone, Marionette, $, _) ->
  class Show.Controller extends Marionette.Controller
    show: ->
      App.vent.trigger('navigated', 'statistics')
      scrobbleStatistics = new App.Entities.ScrobbleStatistics
      @options.region.show(@getShowLayout(scrobbleStatistics))
      scrobbleStatistics.fetch()

    getShowLayout: (scrobbleStatistics)->
      layout = new Show.Layout
      layout.listenTo scrobbleStatistics, 'request', =>
        layout.scrobbleStatsRegion.show(App.request('components:loading:spinner'))
      layout.listenTo scrobbleStatistics, 'sync', =>
        layout.scrobbleStatsRegion.show(@getScrobbleStatsView(scrobbleStatistics))
      layout

    getScrobbleStatsView: (scrobbleStatistics)->
      new Show.ScrobbleStatistics(model: scrobbleStatistics)

  class Show.Router extends Marionette.AppRouter
    appRoutes:
      "statistics": "show"

  App.addInitializer ->
    new Show.Router
      controller: new Show.Controller(region: App.mainRegion)
