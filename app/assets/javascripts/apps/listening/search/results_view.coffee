Musicmatch.module "ListeningApp.Search", (Search, App, Backbone, Marionette, $, _) ->

  class Search.Results extends Marionette.CollectionView
    className: "listening__search__results"
    getItemView: -> Search.Result
    getEmptyView: -> Search.Empty

  class Search.Result extends Marionette.ItemView
    getTemplate: -> JST["apps/listening/search/templates/result"]
    className: "listening__search__result"

    serializeData: ->
      _.extend @model.attributes,
        artist: @model.get('artist').attributes

  class Search.Empty extends Marionette.ItemView
    getTemplate: -> JST["apps/listening/search/templates/empty"]
    className: "listening__search__result-empty"
