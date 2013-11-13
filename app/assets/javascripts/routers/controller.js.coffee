class @MarController extends Backbone.Marionette.Controller

  activity: (activity) ->
    window.MyApp.vent.trigger('activity:filter', activity.trim() || '');

  defaultRoute: ->
    Backbone.history.navigate("activity/tennis", {trigger: true, replace: true})