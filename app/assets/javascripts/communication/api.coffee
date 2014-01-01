Musicmatch.module "Communication.Api", (Api, App, Backbone, Marionette, $, _) ->
  App.reqres.setHandler 'api:url', (resource)->
    "http://localhost:9000/api/#{resource}"
