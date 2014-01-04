Musicmatch = new Marionette.Application

Musicmatch.addRegions
  headerRegion: '.header-region'
  mainRegion: '.main-region'

Musicmatch.on 'start', ->
  Backbone.history.start(pushState: true)

window.Musicmatch = Musicmatch
