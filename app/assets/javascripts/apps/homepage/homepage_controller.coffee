Musicmatch.module "HomepageApp", (HomepageApp, App, Backbone, Marionette, $, _) ->
  class HomepageApp.Controller extends Marionette.Controller
    show: ->
      if App.request('authenticated')
        @options.router.navigate('listening', trigger: true)
      else
        App.mainRegion.show(@getLayout())

    getLayout: ->
      view = new HomepageApp.Layout
      loginController = new HomepageApp.Login.Controller(region: view.loginRegion)
      registrationController = new HomepageApp.Registration.Controller(region: view.registrationRegion)
      view.on 'show', ->
        loginController.show()
        registrationController.show()
      view

  class HomepageApp.Router extends Marionette.AppRouter
    appRoutes:
      "": "show"

  App.addInitializer ->
    controller = new HomepageApp.Controller
    router = new HomepageApp.Router
      controller: controller
    controller.options.router = router
    App.vent.on 'logout', ->
      router.navigate('', trigger: true)
