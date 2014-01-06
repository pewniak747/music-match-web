Musicmatch.module "StatisticsApp.Show", (Show, App, Backbone, Marionette, $, _) ->
  class Show.FavouriteSongs extends Marionette.CompositeView
    getTemplate: -> JST["apps/statistics/show/templates/favourite_songs"]
    className: "statistics__show__favourite-songs"
    itemViewContainer: ".items"
    getItemView: -> Show.FavouriteSong

  class Show.FavouriteSong extends Marionette.ItemView
    getTemplate: -> JST["apps/statistics/show/templates/favourite_song"]
    className: "statistics__show__favourite-song"

    serializeData: ->
      _.extend @model.attributes,
        artist: @model.get('artist').attributes
        statistics:
          total_count_readable: _.pluralize("listen", @model.get('statistics.total_count'))
