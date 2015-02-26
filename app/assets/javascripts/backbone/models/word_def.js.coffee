class DoogleApp.Models.WordDef extends Backbone.Model
  paramRoot: 'word_def'

  url: '/definitions/'

  defaults:
    word: null
    defs: {}

  validate: (attrs, options) ->
    alert "Please enter a word!" if !attrs.word

class DoogleApp.Collections.WordDefsCollection extends Backbone.Collection
  model: DoogleApp.Models.WordDef
  url: '/definitions'
