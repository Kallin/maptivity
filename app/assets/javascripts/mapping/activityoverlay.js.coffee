class @ActivityOverlayView extends google.maps.OverlayView
  constructor: (@map) ->
    console.log("i'm getting constructed yo!")
    @div = null
    @paper = null
    @setMap(@map)

  onAdd: ->
    console.log("i'm getting added yo!")
    div = document.createElement('div')
    div.style.position = 'absolute';
    div.className = "someclass";

    @getPanes().overlayLayer.className = 'overlay-layer'
    @getPanes().overlayLayer.appendChild(div)

    @div = div


    console.log("i'm getting removed")
  onRemove: ->
#      @div.parentNode.removeChild(@div);
#      @div = null;

  draw: ->
    map = $("#map-canvas")

    overlayProjection = @getProjection();

    bounds = @getMap().getBounds()
    sw = overlayProjection.fromLatLngToDivPixel(bounds.getSouthWest());
    ne = overlayProjection.fromLatLngToDivPixel(bounds.getNorthEast());
    @div.style.left = sw.x + 'px';
    @div.style.top = ne.y + 'px';
    @div.style.width = (ne.x - sw.x) + 'px';
    @div.style.height = (sw.y - ne.y) + 'px';

    if (!@paper)
      @paper = new Raphael(@div, map.width(), map.height());

    @paper.clear()

    @paper.setViewBox(sw.x, ne.y, map.width(), map.height())

    courts = [
      {centerLat: 37.801532, centerLon: -122.420358, rotation: -8.5, doubles: false},
      {centerLat: 37.801549, centerLon: -122.420209, rotation: -8.5, doubles: true},
      {centerLat: 37.801569, centerLon: -122.420041, rotation: -8.5, doubles: true},
      {centerLat: 37.801588, centerLon: -122.419892, rotation: -8.5, doubles: false},
      {centerLat: 37.751935, centerLon: -122.465202, rotation: -3.7, doubles: true},
      {centerLat: 37.751948, centerLon: -122.465025, rotation: -3, doubles: true},
      {centerLat: 37.751955, centerLon: -122.464867, rotation: -3, doubles: true}
    ]

    pitch1Center = overlayProjection.fromLatLngToDivPixel(new google.maps.LatLng(37.804855, -122.42437))

    cornerLatLon = overlayProjection.fromDivPixelToLatLng(new google.maps.Point(0, 0));
    offSetLatLon = overlayProjection.fromDivPixelToLatLng(new google.maps.Point(10000, 0));

    # now figure out meter distance of 500 pixels based on long difference
    offsetMeters = google.maps.geometry.spherical.computeDistanceBetween(cornerLatLon, offSetLatLon);
    # assuming for the sake of drawing at close range that both x and y pixels represent the same distance per pixel
    metersPerPixel = offsetMeters / 10000;

    @paintCourt(court, metersPerPixel) for court in courts

    new SoccerPitch(@paper, pitch1Center, 81, metersPerPixel, @getMap().getZoom()).paint()

  paintCourt:(courtData, metersPerPixel) ->
    centerPoint = @getProjection().fromLatLngToDivPixel(new google.maps.LatLng(courtData.centerLat, courtData.centerLon))
    court = new TennisCourt(@paper, centerPoint, courtData.rotation, metersPerPixel, @getMap().getZoom())
    court.setDoubles(courtData.doubles)
    court.paint()