Musicmatch.module "HomepageApp.Registration", (Registration, App, Backbone, Marionette, $, _) ->
  class Registration.Registration extends Marionette.ItemView
    getTemplate: -> JST["apps/homepage/registration/templates/registration"]
    className: "registration"

