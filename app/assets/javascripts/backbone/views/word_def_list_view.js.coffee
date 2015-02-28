class DoogleApp.Views.WordDefsListView extends Backbone.View
  el: '#search-results'

  initialize: (list) ->
    @options = list
    @render()

  render: ->
    @$el.html ""
    for def in @options.list
      @$el.append '<li>' + def + '</li>'
