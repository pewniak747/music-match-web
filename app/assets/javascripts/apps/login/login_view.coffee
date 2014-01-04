Musicmatch.module "LoginApp", (LoginApp, App, Backbone, Marionette, $, _) ->
  class LoginApp.Login extends Marionette.ItemView
    getTemplate: -> JST["apps/login/templates/login"]
    className: "login"

    triggers:
      "submit .js-login-form": "submit"