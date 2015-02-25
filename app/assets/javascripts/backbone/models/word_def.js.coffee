class DoogleApp.Models.WordDef extends Backbone.Model
  paramRoot: 'word_def'

  defaults:
    word: null
    defs: {}

  validate:
    word:
      required: true

class DoogleApp.Collections.WordDefsCollection extends Backbone.Collection
  model: DoogleApp.Models.WordDef
  url: '/word_defs'
