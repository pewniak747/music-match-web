Musicmatch.module "HomepageApp.Registration", (Registration, App, Backbone, Marionette, $, _) ->
  class Registration.Controller extends Marionette.Controller
    show: ->
      @options.region.show(@getRegistrationView())

    getRegistrationView: ->
      new Registration.Registration # TODO: registration submit
