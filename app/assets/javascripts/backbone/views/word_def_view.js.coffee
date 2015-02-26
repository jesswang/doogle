class DoogleApp.Views.WordDefsView extends Backbone.View
  el: 'body'

  events:
    "click #search-button" : "search"

  template: JST["backbone/templates/word_def"]

  initialize: ->
    @render()

  render: ->
    @$el.html @template()

  search: ->
    model = new DoogleApp.Models.WordDef({ word: @$el.find('input[type="search"]').val() })
