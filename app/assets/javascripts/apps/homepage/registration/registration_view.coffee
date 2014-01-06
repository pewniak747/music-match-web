Musicmatch.module "HomepageApp.Registration", (Registration, App, Backbone, Marionette, $, _) ->
  class Registration.Registration extends Marionette.ItemView
    getTemplate: -> JST["apps/homepage/registration/templates/registration"]
    className: "registration"

    bindings:
      "input[name=email]": "email"
      "input[name=password]": "password"
      "input[name=password_confirmation]": "password_confirmation"

    ui:
      submitButton: ".js-registration-form button[type=submit]"

    triggers:
      "submit .js-registration-form": "submit"

    modelEvents: ->
      "error sync change": "enableSubmit"
      "request": "disableSubmit"

    onRender: ->
      Backbone.Validation.bind(@)
      @stickit()

    enableSubmit: ->
      @ui.submitButton.attr('disabled', false).removeClass('pure-button-disabled').text("Sign up")

    disableSubmit: ->
      @ui.submitButton.attr('disabled', 'disabled').addClass('pure-button-disabled').text("Signing you up...")
