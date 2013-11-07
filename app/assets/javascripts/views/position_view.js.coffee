class @PositionView extends Backbone.View

  initialize: ->
    @render()

  el: '#position'

  template: JST["position"]

  render: ->
    this.$el.html(@template());

