Musicmatch.module "HeaderApp", (HeaderApp, App, Backbone, Marionette, $, _) ->
  class HeaderApp.Header extends Marionette.ItemView
    template: -> JST["apps/header/templates/header"]
    className: "header"

