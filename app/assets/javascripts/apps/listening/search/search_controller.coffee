Musicmatch.module "ListeningApp.Search", (Search, App, Backbone, Marionette, $, _) ->
  class Search.Controller extends Marionette.Controller
    search: ->
      @options.region.show(@getLayout())

    getLayout: ->
      layout = new Search.Layout
      layout.on 'show', =>
        layout.searchRegion.show(@getSearchView())
      layout

    getSearchView: ->
      new Search.Search
