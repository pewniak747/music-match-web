#= require entities/song

Musicmatch.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.Recommendation extends Backbone.AssociatedModel
    relations: [
      type: Backbone.One
      key: 'song'
      relatedModel: Entities.Song
    ]

  class Entities.Recommendations extends Backbone.Collection
    model: Entities.Recommendation

    url: -> App.request('api:url', 'me/recommendations')

    parse: (response)->
      response.items
