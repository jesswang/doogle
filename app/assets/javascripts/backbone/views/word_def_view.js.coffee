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
    model = new DoogleApp.Models.WordDef({ word: @$el.find('input[type="search"]').val() })
    $.ajax
      type: "GET"
      url: "http://dictionaryapi.com/api/v1/references/collegiate/xml/#{model.get("word")}?key=cab72891-f003-43ef-a983-253666d45082"
      data:
        authenticity_token: authToken()
      success: (data) =>
        alert data