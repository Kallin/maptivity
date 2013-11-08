class @MapView extends Backbone.View

  initialize: ->
    google.maps.visualRefresh = true;

    #  google.maps.event.addDomListener(window, 'load', initMaps);

    mapOptions =
      zoom: 19
      center: new google.maps.LatLng(43.668081, -79.415638)
      mapTypeId: google.maps.MapTypeId.HYBRID
      tilt: 0

    map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);

    @myOverlay = new ActivityOverlayView map

    google.maps.event.addListener map, "idle", =>
      @myOverlay.draw();

    google.maps.event.addListener map, "click", (evt) ->
      Backbone.pubSub.trigger("latLngUpdate", evt.latLng);

    @collection = new CourtCollection()
    @collection.fetch({reset: true})
    @listenTo(@collection, 'reset', @render);

  render: ->
    @myOverlay.setCourts(@collection.models)
    @myOverlay.draw()