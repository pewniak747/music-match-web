Musicmatch.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.ScrobbleStatistics extends Backbone.AssociatedModel
    url: -> App.request('api:url', 'me/scrobbles/statistics')
