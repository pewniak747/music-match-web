#= require entities/scrobble_statistics

Musicmatch.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.Artist extends Backbone.AssociatedModel
    relations: [
      type: Backbone.One
      key: 'statistics'
      relatedModel: Entities.ScrobbleStatistics
    ]

  class Entities.Artists extends Backbone.Collection
    model: Entities.Artist

    parse: (response)->
      response.items

  App.reqres.setHandler 'entities:artists:favourites', ->
    collection = new Entities.Artists
    collection.url = App.request('api:url', 'me/artists/statistics')
    collection
