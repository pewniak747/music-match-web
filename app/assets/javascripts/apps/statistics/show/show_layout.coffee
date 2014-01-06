Musicmatch.module "StatisticsApp.Show", (Show, App, Backbone, Marionette, $, _) ->
  class Show.Layout extends Marionette.Layout
    getTemplate: -> JST["apps/statistics/show/templates/layout"]
    className: "statistics__show__layout"

    regions:
      scrobbleStatsRegion: ".scrobble-stats-region"
      userRegion: ".user-region"
      favouriteSongsRegion: ".favourite-songs-region"
      topArtistsRegion: ".top-artists-region"
