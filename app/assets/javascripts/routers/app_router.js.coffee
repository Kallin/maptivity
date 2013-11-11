class @AppRouter extends Backbone.Router

  initialize: ->
    Backbone.pubSub = _.extend({}, Backbone.Events);

  routes:
    "activity/:activity": "activity",
    '*path': 'defaultRoute'

  activity: (activity) ->
    @closeView(@positionView)
    @closeView(@navView)
    @closeView(@mapView)

    @positionView = new PositionView()
    @navView = new NavView()
    @navView.setActivity(activity)
    @mapView = new MapView()

  defaultRoute: ->
    @navigate("activity/tennis", {trigger: true, replace: true})

  closeView: (view) ->
    if view
      view.undelegateEvents()

