Musicmatch.module "RecommendationsApp.Show", (Show, App, Backbone, Marionette, $, _) ->
  class Show.Show extends Marionette.ItemView
    template: -> JST["apps/recommendations/show/templates/show"]
