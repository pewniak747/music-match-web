Musicmatch.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.ScrobbleStatistics extends Backbone.Model
    url: -> App.request('api:url', 'me/scrobbles/statistics')

