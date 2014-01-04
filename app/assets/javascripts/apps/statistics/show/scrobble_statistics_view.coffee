Musicmatch.module "StatisticsApp.Show", (Show, App, Backbone, Marionette, $, _) ->
  class Show.ScrobbleStatistics extends Marionette.ItemView
    getTemplate: -> JST["apps/statistics/show/templates/scrobble_statistics"]
    className: "statistics__show__scrobble-statistics"
