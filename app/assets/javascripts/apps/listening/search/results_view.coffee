Musicmatch.module "ListeningApp.Search", (Search, App, Backbone, Marionette, $, _) ->

  class Search.Results extends Marionette.CollectionView
    className: "listening__search__results"
    getItemView: -> Search.Result
    getEmptyView: -> Search.Empty

  class Search.Result extends Marionette.ItemView
    getTemplate: -> JST["apps/listening/search/templates/result"]
    className: "listening__search__result"

    ui:
      scrobbleButton: '.js-scrobble-button'

    triggers:
      'click @ui.scrobbleButton': 'scrobble'

    initialize: ->
      @on 'scrobble', =>
        @ui.scrobbleButton.addClass('pure-button-disabled').text('got it!').attr('disabled', 'disabled')

    serializeData: ->
      _.extend @model.attributes,
        artist: @model.get('artist').attributes

  class Search.Empty extends Marionette.ItemView
    getTemplate: -> JST["apps/listening/search/templates/empty"]
    className: "listening__search__result-empty"
