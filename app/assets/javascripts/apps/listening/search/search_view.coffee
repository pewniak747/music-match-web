Musicmatch.module "ListeningApp.Search", (Search, App, Backbone, Marionette, $, _) ->
  class Search.Search extends Marionette.ItemView
    template: -> JST["apps/listening/search/templates/search"]
    className: "listening__search"

    bindings:
      'input[name=filter]': 'filter'

    onRender: ->
      @stickit()
