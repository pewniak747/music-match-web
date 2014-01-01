Musicmatch.module "ListeningApp.Search", (Search, App, Backbone, Marionette, $, _) ->
  class Search.Layout extends Marionette.Layout
    template: -> JST["apps/listening/search/templates/layout"]
    className: "listening__search__layout"

    regions:
      searchRegion: '.search-region'
      resultsRegion: '.results-region'
