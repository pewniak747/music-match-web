Musicmatch.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.Registration extends Backbone.Model
    validation:
      login:
        required: true
      password:
        required: true
      password_confirmation:
        required: true

  App.reqres.setHandler "entities:registration", ->
    new Entities.Registration
