Musicmatch.module "HomepageApp.Registration", (Registration, App, Backbone, Marionette, $, _) ->
  class Registration.Controller extends Marionette.Controller
    show: ->
      registration = App.request('entities:registration')
      @options.region.show(@getRegistrationView(registration))

    getRegistrationView: (registration)->
      view = new Registration.Registration(model: registration)
      view.on 'submit', ->
        registration.validate() # TODO: registration POST
      view
