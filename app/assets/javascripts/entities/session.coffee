Musicmatch.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
  class Entities.Session extends Backbone.Model

  App.reqres.setHandler "entities:session", ->
    new Entities.Session
