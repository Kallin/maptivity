$ ->
  Maptivity.initialize()

window.Maptivity =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    @Routers.mainRouter = new AppRouter()
    Backbone.history.start()







