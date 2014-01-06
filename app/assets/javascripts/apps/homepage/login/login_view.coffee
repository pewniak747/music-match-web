Musicmatch.module "HomepageApp.Login", (Login, App, Backbone, Marionette, $, _) ->
  class Login.Login extends Marionette.ItemView
    getTemplate: -> JST["apps/homepage/login/templates/login"]
    className: "login"

    triggers:
      "submit .js-login-form": "submit"

    bindings:
      "input[name=email]": "login"
      "input[name=password]": "password"

    ui:
      authenticationError: ".js-authentication-error"
      submitButton: ".js-login-form button[type=submit]"

    modelEvents:
      "error": "showError enableSubmit"
      "sync change": "hideError enableSubmit"

    initialize: ->
      @on 'submit', @disableSubmit

    onRender: ->
      @hideError()
      @stickit()

    showError: ->
      @ui.authenticationError.show()

    hideError: ->
      @ui.authenticationError.hide()

    enableSubmit: ->
      @ui.submitButton.attr('disabled', false).removeClass('pure-button-disabled')

    disableSubmit: ->
      @ui.submitButton.attr('disabled', 'disabled').addClass('pure-button-disabled')
