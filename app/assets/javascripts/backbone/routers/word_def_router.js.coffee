class DoogleApp.Routers.WordDefRouter extends Backbone.Router

  initialize: ->
    @defs = new DoogleApp.Collections.WordDefsCollection()

  routes:
    ".*"  : "index"

  index: ->
    @view = new DoogleApp.Views.WordDefsView()