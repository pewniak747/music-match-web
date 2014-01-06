Musicmatch.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.Registration extends Backbone.Model
    url: -> App.request('api:url', 'registrations')

    validation:
      email:
        required: true
      password:
        required: true
      password_confirmation:
        required: true

  App.reqres.setHandler "entities:registration", ->
    new Entities.Registration
