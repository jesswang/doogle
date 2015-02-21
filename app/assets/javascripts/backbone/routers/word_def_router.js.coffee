class DoogleApp.Routers.WordDefRouter extends Backbone.Router

  routes:
    ".*"  : "index"

  index: ->
    @view = new DoogleApp.Views.WordDefsView()