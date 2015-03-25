class DoogleApp.Views.WordDefsListView extends Backbone.View
  el: '#search-results'

  initialize: (list) ->
    @options = list
    @render()

  render: ->
    @$el.html ""
    if @options.list.length > 0
      for def in @options.list
        @$el.append '<li>' + def + '</li>'
    else
      @$el.append "Sorry, no definitions were found. Please try another search."
