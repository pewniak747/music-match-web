Musicmatch.module "StatisticsApp.Show", (Show, App, Backbone, Marionette, $, _) ->
  class Show.Controller extends Marionette.Controller
    show: ->
      App.vent.trigger('navigated', 'statistics')
      scrobbleStatistics = new App.Entities.ScrobbleStatistics
      user = App.request('entities:current_user')
      favouriteSongs = App.request('entities:songs:favourites')
      favouriteArtists = App.request('entities:artists:favourites')
      @options.region.show(@getShowLayout(scrobbleStatistics, user, favouriteSongs, favouriteArtists))
      scrobbleStatistics.fetch()
      user.fetch()
      favouriteSongs.fetch()
      favouriteArtists.fetch()

    getShowLayout: (scrobbleStatistics, user, favouriteSongs, favouriteArtists)->
      layout = new Show.Layout
      layout.listenTo scrobbleStatistics, 'request', =>
        layout.scrobbleStatsRegion.show(App.request('components:loading:spinner'))
      layout.listenTo scrobbleStatistics, 'sync', =>
        layout.scrobbleStatsRegion.show(@getScrobbleStatsView(scrobbleStatistics))
      layout.listenTo user, 'request', =>
        layout.userRegion.show(App.request('components:loading:spinner'))
      layout.listenTo user, 'sync', =>
        layout.userRegion.show(@getUserView(user))
      layout.listenTo favouriteSongs, 'request', =>
        layout.favouriteSongsRegion.show(App.request('components:loading:spinner'))
      layout.listenTo favouriteSongs, 'sync', =>
        layout.favouriteSongsRegion.show(@getFavouriteSongsView(favouriteSongs))
      layout.listenTo favouriteArtists, 'request', =>
        layout.favouriteArtistsRegion.show(App.request('components:loading:spinner'))
      layout.listenTo favouriteArtists, 'sync', =>
        layout.favouriteArtistsRegion.show(@getFavouriteArtistsView(favouriteArtists))
      layout

    getScrobbleStatsView: (scrobbleStatistics)->
      new Show.ScrobbleStatistics(model: scrobbleStatistics)

    getUserView: (user)->
      new Show.User(model: user)

    getFavouriteSongsView: (favouriteSongs)->
      new Show.FavouriteSongs(collection: favouriteSongs)

    getFavouriteArtistsView: (favouriteArtists)->
      new Show.FavouriteArtists(collection: favouriteArtists)

  class Show.Router extends Marionette.AppRouter
    appRoutes:
      "statistics": "show"

  App.addInitializer ->
    new Show.Router
      controller: new Show.Controller(region: App.mainRegion)
