Musicmatch.module "StatisticsApp.Show", (Show, App, Backbone, Marionette, $, _) ->
  class Show.Controller extends Marionette.Controller
    show: ->
      App.vent.trigger('navigated', 'statistics')
      scrobbleStatistics = new App.Entities.ScrobbleStatistics
      user = App.request('entities:current_user')
      @options.region.show(@getShowLayout(scrobbleStatistics, user))
      scrobbleStatistics.fetch()
      user.fetch()

    getShowLayout: (scrobbleStatistics, user)->
      layout = new Show.Layout
      layout.listenTo scrobbleStatistics, 'request', =>
        layout.scrobbleStatsRegion.show(App.request('components:loading:spinner'))
      layout.listenTo scrobbleStatistics, 'sync', =>
        layout.scrobbleStatsRegion.show(@getScrobbleStatsView(scrobbleStatistics))
      layout.listenTo user, 'request', =>
        layout.userRegion.show(App.request('components:loading:spinner'))
      layout.listenTo user, 'sync', =>
        layout.userRegion.show(@getUserView(user))
      layout

    getScrobbleStatsView: (scrobbleStatistics)->
      new Show.ScrobbleStatistics(model: scrobbleStatistics)

    getUserView: (user)->
      new Show.User(model: user)

  class Show.Router extends Marionette.AppRouter
    appRoutes:
      "statistics": "show"

  App.addInitializer ->
    new Show.Router
      controller: new Show.Controller(region: App.mainRegion)
