Musicmatch.module "Communication.Navigation", (Navigation, App, Backbone, Marionette, $, _) ->
  App.commands.setHandler 'navigate', (hash)->
    window.location.hash = hash
    App.vent.trigger('navigated', hash)

  App.reqres.setHandler 'current:location', ->
    window.location.hash[1..-1]
