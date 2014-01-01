Musicmatch.module "ListeningApp.Search", (Search, App, Backbone, Marionette, $, _) ->
  class Search.Controller extends Marionette.Controller
    search: ->
      collection = new App.Entities.Songs
      form = new Backbone.Model
      @options.region.show(@getLayout(form, collection))
      form.on 'change:filter', (form, value)=>
        collection.fetch(data: {filter: value})

    getLayout: (form, collection)->
      layout = new Search.Layout
      layout.on 'show', =>
        layout.searchRegion.show(@getSearchView(form))
      collection.on 'sync', =>
        layout.resultsRegion.show(@getResultsView(collection))
      collection.on 'request', =>
        layout.resultsRegion.show(@getLoadingView())
      layout

    getSearchView: (form)->
      new Search.Search(model: form)

    getResultsView: (collection)->
      view = new Search.Results(collection: collection)
      view.on 'itemview:scrobble', (view, options)->
        # TODO scrobble options.model
      view

    getLoadingView: ->
      App.request('components:loading:spinner')
