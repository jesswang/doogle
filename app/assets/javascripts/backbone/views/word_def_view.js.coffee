class DoogleApp.Views.WordDefsView extends Backbone.View
  el: '#search-results'

  template: JST["backbone/templates/word_def"]

  tagName: 'li'

  initialize: ->
    @render()

  render: ->
    @$el.html @template()