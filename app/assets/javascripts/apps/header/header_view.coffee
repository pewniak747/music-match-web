Musicmatch.module "HeaderApp", (HeaderApp, App, Backbone, Marionette, $, _) ->
  class HeaderApp.Header extends Marionette.ItemView
    template: -> JST["apps/header/templates/header"]
    className: "header"

    modelEvents:
      'change:current': 'currentChanged'

    onRender: ->
      @currentChanged(@model, @model.get('current'))

    currentChanged: (model, value)->
      @$('.js-menu li').removeClass('pure-menu-selected')
      @$(".js-menu li[for=#{value}]").addClass('pure-menu-selected')

