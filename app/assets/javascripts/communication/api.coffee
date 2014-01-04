Musicmatch.module "Communication.Api", (Api, App, Backbone, Marionette, $, _) ->
  App.reqres.setHandler 'api:url', (resource)->
    "#{gon.api_url}/api/#{resource}"
