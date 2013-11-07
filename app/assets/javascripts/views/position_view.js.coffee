class @PositionView extends Backbone.View

  latLng: null

  initialize: ->
    @render()
    Backbone.pubSub.on('latLngUpdate', @updateLatLng);

  el: '#position'

  template: JST["position"]

  updateLatLng: (evt) =>
    console.log('updating latlng!')
    console.log(evt)
    @latLng = evt
    @render()

  render: ->
    if (@latLng)
      this.$el.html(@template({lat: @latLng.lat(), lng: @latLng.lng()}));


