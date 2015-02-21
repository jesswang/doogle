class DoogleApp.Models.WordDef extends Backbone.Model
  paramRoot: 'word_def'

class DoogleApp.Collections.WordDefsCollection extends Backbone.Collection
  model: DoogleApp.Models.WordDef
  url: '/word_defs'
