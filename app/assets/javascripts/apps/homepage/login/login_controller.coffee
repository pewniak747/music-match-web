Musicmatch.module "HomepageApp.Login", (Login, App, Backbone, Marionette, $, _) ->
  class Login.Controller extends Marionette.Controller
    show: ->
      session = App.request("entities:session")
      @options.region.show(@getLoginView(session))

    getLoginView: (session)->
      view = new Login.Login(model: session)
      view.on 'submit', ->
        App.execute("authenticate", session)
      view
