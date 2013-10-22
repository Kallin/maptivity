$ ->
  initMap()
  Maptivity.initialize()

initMap = ->
  google.maps.visualRefresh = true;
  google.maps.event.addDomListener(window, 'load', initMaps);

initMaps = ->

  mapOptions =
    zoom: 19
    center: new google.maps.LatLng(37.8012, -122.42)
    mapTypeId: google.maps.MapTypeId.HYBRID
    tilt: 0

  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

  swBound = new google.maps.LatLng(62.281819, -150.287132);
  neBound = new google.maps.LatLng(62.400471, -150.005608);
  bounds = new google.maps.LatLngBounds(swBound, neBound);

  window.myOverlay = new ActivityOverlayView bounds, map

  google.maps.event.addListener map, "idle", ->
    window.myOverlay.draw();

window.Maptivity =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    console.log('Hello from Backbone!')

