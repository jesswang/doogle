class DoogleApp.Views.WordDefsView extends Backbone.View
  el: 'body'

  events:
    "click #search-button" : "search"

  template: JST["backbone/templates/word_def"]

  initialize: ->
    @render()
    @model = new DoogleApp.Models.WordDef()

  render: ->
    @$el.html @template()

  search: ->
    @model.set({ word: @$el.find('input[type="search"]').val() }, { validate: true })
    @model.fetch()


