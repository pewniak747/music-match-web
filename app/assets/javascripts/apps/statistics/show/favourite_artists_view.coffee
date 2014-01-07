Musicmatch.module "StatisticsApp.Show", (Show, App, Backbone, Marionette, $, _) ->
  class Show.FavouriteArtists extends Marionette.CompositeView
    getTemplate: -> JST["apps/statistics/show/templates/favourite_artists"]
    className: "statistics__show__favourite-artists"
    itemViewContainer: ".items"
    getItemView: -> Show.FavouriteArtist

  class Show.FavouriteArtist extends Marionette.ItemView
    getTemplate: -> JST["apps/statistics/show/templates/favourite_artist"]
    className: "statistics__show__favourite-artist"

    serializeData: ->
      _.extend @model.attributes,
        statistics:
          total_count_readable: _.pluralize("listen", @model.get('statistics.total_count'))
