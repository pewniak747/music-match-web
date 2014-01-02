#= require entities/song

Musicmatch.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.Scrobble extends Backbone.AssociatedModel
    relations: [
      type: Backbone.One
      key: 'song'
      relatedModel: Entities.Song
    ]

    url: -> App.request('api:url', 'me/scrobbles')

    toJSON: ->
      song_id: @get('song').id
