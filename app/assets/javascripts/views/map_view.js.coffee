class @MapView extends Backbone.Marionette.ItemView

  initialize: ->
    google.maps.visualRefresh = true;

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
      window.MyApp.vent.trigger('latlng:update', evt.latLng);

    @collection = new CourtCollection()
    @collection.fetch({reset: true, data: {activity: "handball"}})
    @listenTo(@collection, 'reset', @render);

  render: ->
    @myOverlay.setCourts(@collection.models)
    @myOverlay.draw()

    $("#map-canvas").height($(window).height() - $("#position").height() - 100);