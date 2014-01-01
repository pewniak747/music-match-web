Musicmatch.module "HeaderApp", (HeaderApp, App, Backbone, Marionette, $, _) ->
  class HeaderApp.Controller extends Marionette.Controller
    show: ->
      App.headerRegion.show(@getHeaderView())

    getHeaderView: ->
      model = new Backbone.Model(current: App.request('current:location'))
      @listenTo App.vent, 'navigated', (where) =>
        model.set('current', where)
      new HeaderApp.Header(model: model)

  App.addInitializer ->
    controller = new HeaderApp.Controller
    controller.show()
