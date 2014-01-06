Musicmatch.module "StatisticsApp.Show", (Show, App, Backbone, Marionette, $, _) ->
  class Show.User extends Marionette.ItemView
    getTemplate: -> JST["apps/statistics/show/templates/user"]
    className: "statistics__show__user"

    onRender: ->
      @timestampInterval = setInterval =>
        @regenerateTimestamp()
      , 60*1000
      @regenerateTimestamp()

    onClose: ->
      clearInterval(@timestampInterval)

    regenerateTimestamp: ->
      @$('.js-timestamp').text(@getTimestamp())

    getTimestamp: ->
      moment(@model.get('created_at')).fromNow()
