Musicmatch.module "RecommendationsApp.Show", (Show, App, Backbone, Marionette, $, _) ->
  class Show.Recommendations extends Marionette.CompositeView
    getTemplate: -> JST["apps/recommendations/show/templates/show"]
    getItemView: -> Show.Recommendation
    itemViewContainer: ".items"
    className: "recommendations"

  class Show.Recommendation extends Marionette.ItemView
    getTemplate: -> JST["apps/recommendations/show/templates/recommendation"]
    className: "recommendations__recommendation"

    serializeData: ->
      _.extend @model.attributes,
        song: _.extend @model.get('song').attributes,
          artist: @model.get('song.artist').attributes
