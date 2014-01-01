Musicmatch.module "Components.Loading", (Loading, App, Backbone, Marionette, $, _) ->
  class Loading.Spinner extends Marionette.ItemView
    className: "loading__spinner"
    template: -> ""

    onShow: ->
      @$el.spin()

  App.reqres.setHandler 'components:loading:spinner', ->
    new Loading.Spinner
