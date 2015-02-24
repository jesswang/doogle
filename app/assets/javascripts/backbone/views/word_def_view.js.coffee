class DoogleApp.Views.WordDefsView extends Backbone.View
  el: '#search-results'

  events:
    "click #search-button" : "search"

  template: JST["backbone/templates/word_def"]

  tagName: 'li'

  initialize: ->
    @render()

  render: ->
    @$el.html @template()

  search: ->
    debugger