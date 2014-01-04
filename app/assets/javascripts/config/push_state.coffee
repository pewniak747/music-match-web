$ ->
  $("a").on "click", (evt)->
    href = $(@).attr("href")
    if (href[0] == "/")
      evt.preventDefault()
      Backbone.history.navigate(href, trigger: true)
