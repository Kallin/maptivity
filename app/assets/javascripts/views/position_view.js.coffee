class @PositionView extends Backbone.View

  EMPTY_LATLNG_MESSAGE: "Please Click Somewhere!"
  latLng: null

  el: '#position'

  template: JST["position"]

  initialize: ->
    @render()
    Backbone.pubSub.on('latLngUpdate', @updateLatLng);

  updateLatLng: (evt) =>
    @latLng = evt
    @render()

  render: ->

    if (@latLng?)
      html = @template({lat: @latLng.lat(), lng: @latLng.lng()})
    else
      html = @template({lat: @EMPTY_LATLNG_MESSAGE, lng: @EMPTY_LATLNG_MESSAGE})

    this.$el.html(html);




