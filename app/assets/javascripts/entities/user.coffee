Musicmatch.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.User extends Backbone.Model
    url: -> App.request('api:url', 'me')

  App.reqres.setHandler 'entities:current_user', ->
    new Entities.User
