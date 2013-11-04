$ ->
  initMap()
  Maptivity.initialize()

initMap = ->
  google.maps.visualRefresh = true;
  google.maps.event.addDomListener(window, 'load', initMaps);

initMaps = ->
  mapOptions =
    zoom: 19
    center: new google.maps.LatLng(43.668081, -79.415638)
    mapTypeId: google.maps.MapTypeId.HYBRID
    tilt: 0

  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

  window.myOverlay = new ActivityOverlayView map

  google.maps.event.addListener map, "idle", ->
    window.myOverlay.draw();

  google.maps.event.addListener map, "click", (evt) ->
    latLng = evt.latLng
    $("#position .lat").text(latLng.lat())
    $("#position .lng").text(latLng.lng())



window.Maptivity =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    console.log('Hello from Backbone!')

