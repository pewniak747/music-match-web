#= require entities/song

Musicmatch.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.Recommendation extends Backbone.AssociatedModel
    urlRoot: -> App.request('api:url', 'me/recommendations')
    relations: [
      type: Backbone.One
      key: 'song'
      relatedModel: Entities.Song
    ]

  class Entities.Recommendations extends Backbone.Collection
    url: -> App.request('api:url', 'me/recommendations')
    model: Entities.Recommendation

    parse: (response)->
      response.items

  App.reqres.setHandler 'entities:recommendation', ->
    new Entities.Recommendation
