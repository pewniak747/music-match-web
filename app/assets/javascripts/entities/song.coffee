#= require entities/artist

Musicmatch.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.Song extends Backbone.AssociatedModel
    relations: [
      type: Backbone.One
      key: 'artist'
      relatedModel: Entities.Artist
    ]

  class Entities.Songs extends Backbone.Collection
    model: Entities.Song

    url: -> App.request('api:url', 'songs')

    parse: (response)->
      response.items
