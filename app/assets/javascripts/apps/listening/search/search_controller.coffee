Musicmatch.module "ListeningApp.Search", (Search, App, Backbone, Marionette, $, _) ->
  class Search.Controller extends Marionette.Controller
    search: ->
      collection = new App.Entities.Songs
      @options.region.show(@getLayout(collection))
      collection.fetch()

    getLayout: (collection)->
      layout = new Search.Layout
      layout.on 'show', =>
        layout.searchRegion.show(@getSearchView())
      collection.on 'sync', =>
        layout.resultsRegion.show(@getResultsView(collection))
      layout

    getSearchView: ->
      new Search.Search

    getResultsView: (collection)->
      new Search.Results(collection: collection)
