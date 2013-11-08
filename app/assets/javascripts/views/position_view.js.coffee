class @PositionView extends Backbone.View

  EMPTY_LATLNG_MESSAGE: "Please Click Somewhere!"
  latLng: null

  initialize: ->
    @render()
    Backbone.pubSub.on('latLngUpdate', @updateLatLng);

  el: '#position'

  template: JST["position"]

  updateLatLng: (evt) =>
    @latLng = evt
    @render()

  render: ->

    if (@latLng?)
      html = @template({lat: @latLng.lat(), lng: @latLng.lng()})
    else
      html = @template({lat: @EMPTY_LATLNG_MESSAGE, lng: @EMPTY_LATLNG_MESSAGE})

    this.$el.html(html);




