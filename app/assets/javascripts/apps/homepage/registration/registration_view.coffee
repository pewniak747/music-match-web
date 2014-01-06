Musicmatch.module "HomepageApp.Registration", (Registration, App, Backbone, Marionette, $, _) ->
  class Registration.Registration extends Marionette.ItemView
    getTemplate: -> JST["apps/homepage/registration/templates/registration"]
    className: "registration"

    bindings:
      "input[name=email]": "login"
      "input[name=password]": "password"
      "input[name=password_confirmation]": "password_confirmation"

    triggers:
      "submit .js-registration-form": "submit"

    onRender: ->
      Backbone.Validation.bind(@)
      @stickit()
