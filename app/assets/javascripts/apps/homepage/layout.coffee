Musicmatch.module "HomepageApp", (HomepageApp, App, Backbone, Marionette, $, _) ->
  class HomepageApp.Layout extends Marionette.Layout
    getTemplate: -> JST["apps/homepage/templates/layout"]
    regions:
      registrationRegion: '.registration-region'
      loginRegion: '.login-region'
