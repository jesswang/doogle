class DoogleApp.Views.WordDefsView extends Backbone.View
  el: '#search-container'

  events:
    "click #search-button" : "search"

  template: JST["backbone/templates/word_def"]

  initialize: ->
    @render()

  render: ->
    @$el.html @template()

  search: ->
    debugger