Musicmatch.module "HeaderApp", (HeaderApp, App, Backbone, Marionette, $, _) ->
  class HeaderApp.Header extends Marionette.ItemView
    template: -> JST["apps/header/templates/header"]
    className: "header"

    modelEvents:
      'change:current': 'currentChanged'

    triggers:
      "click .js-logout-button": "logout"

    initialize: ->
      @listenTo App.vent, 'login', => @$el.show()
      @listenTo App.vent, 'logout', => @$el.hide()

    onRender: ->
      @currentChanged(@model, @model.get('current'))

    currentChanged: (model, value)->
      @$('.js-menu li').removeClass('pure-menu-selected')
      @$(".js-menu li[for=#{value}]").addClass('pure-menu-selected')
