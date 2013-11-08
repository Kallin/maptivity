$ ->
  Maptivity.initialize()

window.Maptivity =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    Backbone.pubSub = _.extend({}, Backbone.Events);
    new PositionView()
    new MapView()







