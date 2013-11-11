class @NavView extends Backbone.View

  el: '#nav'

  template: JST["nav"]

  events:
    "click .handball": "go"
    "click .tennis": "go",
    "click .soccer": "go"

  go: (event) ->
    target = $(event.target).data('target');

    event.preventDefault()
    window.Maptivity.Routers.mainRouter.navigate("activity/#{target}", {trigger: true})


  initialize: ->
    @registerHelper()
    @render()

  setActivity: (@activity) ->
#    TODO: should the model update be triggering a render?
    @render()

  render: ->

    activities = [
      {name: 'Handball', active: (@activity is "handball"), activityClass: 'handball'},
      {name: 'Tennis', active: (@activity is "tennis"), activityClass: 'tennis'},
      {name: 'Soccer', active: (@activity is "soccer"), activityClass: 'soccer'}
    ]

    this.$el.html @template({activities: activities});

  registerHelper: ->
    Handlebars.registerHelper "checkActive" , ->
      return "active" if this.active