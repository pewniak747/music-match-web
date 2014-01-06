#= require entities/artist
#= require entities/scrobble_statistics

Musicmatch.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.Song extends Backbone.AssociatedModel
    relations: [
      type: Backbone.One
      key: 'artist'
      relatedModel: Entities.Artist
    ,
      type: Backbone.One
      key: 'statistics'
      relatedModel: Entities.ScrobbleStatistics
    ]

  class Entities.Songs extends Backbone.Collection
    model: Entities.Song

    url: -> App.request('api:url', 'songs')

    parse: (response)->
      response.items

  App.reqres.setHandler 'entities:songs:favourites', ->
    collection = new Entities.Songs
    collection.url = App.request('api:url', 'me/songs/statistics')
    collection
