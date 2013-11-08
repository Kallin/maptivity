$ ->
  initMap()
  Maptivity.initialize()

window.Maptivity =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    Backbone.pubSub = _.extend({}, Backbone.Events);
    new PositionView()
    collection = new CourtCollection()
    collection.fetch()

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
    Backbone.pubSub.trigger("latLngUpdate", evt.latLng);






