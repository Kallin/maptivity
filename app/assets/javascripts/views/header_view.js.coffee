class @HeaderView extends Backbone.Marionette.ItemView

  el: '#nav'

  template: JST["nav"]

  events:
    "click .handball": "navToTarget"
    "click .tennis": "navToTarget",
    "click .soccer": "navToTarget"

  initialize: ->
    window.MyApp.vent.on 'activity:filter', @updateFilterSelection

#    TODO: try using marionette's built-in helper support
    Handlebars.registerHelper "checkActive", ->
      return "active" if this.active

  serializeData: ->
    return {activities: [
      {name: 'Handball', active: (@activity is "handball"), activityClass: 'handball'},
      {name: 'Tennis', active: (@activity is "tennis"), activityClass: 'tennis'},
      {name: 'Soccer', active: (@activity is "soccer"), activityClass: 'soccer'}
    ]}

  updateFilterSelection: (evt) =>
    @activity = evt
    @render()

  navToTarget: ->
    target = $(event.target).data('target');
    event.preventDefault()
    Backbone.history.navigate("activity/#{target}", {trigger: true, replace: true})




