Musicmatch.module "RecommendationsApp.Show", (Show, App, Backbone, Marionette, $, _) ->
  class Show.Recommendations extends Marionette.CompositeView
    getTemplate: -> JST["apps/recommendations/show/templates/show"]
    getItemView: -> Show.Recommendation
    getEmptyView: -> Show.Empty
    itemViewContainer: ".items"
    className: "recommendations"

    ui:
      refreshButton: ".js-refresh-button"

    triggers:
      "click @ui.refreshButton": "refresh"

    initialize: ->
      @on "refresh", =>
        @ui.refreshButton.addClass('pure-button-disabled').attr('disabled', 'disabled').text('recommendations will be refreshed soon')

  class Show.Recommendation extends Marionette.ItemView
    getTemplate: -> JST["apps/recommendations/show/templates/recommendation"]
    className: "recommendations__recommendation"

    serializeData: ->
      _.extend @model.attributes,
        song: _.extend @model.get('song').attributes,
          artist: @model.get('song.artist').attributes

  class Show.Empty extends Marionette.ItemView
    getTemplate: -> JST["apps/recommendations/show/templates/empty"]
