Musicmatch.module "HeaderApp", (HeaderApp, App, Backbone, Marionette, $, _) ->
  class HeaderApp.Controller extends Marionette.Controller
    show: ->
      App.headerRegion.show(@getHeaderView())

    getHeaderView: ->
      new HeaderApp.Header

  App.addInitializer ->
    controller = new HeaderApp.Controller
    controller.show()
