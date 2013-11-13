class @PositionView extends Backbone.Marionette.ItemView

  EMPTY_LATLNG_MESSAGE: "Please Click Somewhere!"
  latLng: null

  el: '#position'

  template: JST["position"]

  initialize: ->
    window.MyApp.vent.on 'latlng:update', @updateLatLng
    @render()

  updateLatLng: (evt) =>
    @latLng = evt
    @render()

  serializeData: ->
    if (@latLng?)
      return {lat: @latLng.lat(), lng: @latLng.lng()}
    else
      return {lat: @EMPTY_LATLNG_MESSAGE, lng: @EMPTY_LATLNG_MESSAGE}


