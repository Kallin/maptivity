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

    court1Center = overlayProjection.fromLatLngToDivPixel(new google.maps.LatLng(37.801532, -122.420358))
    court2Center = overlayProjection.fromLatLngToDivPixel(new google.maps.LatLng(37.801549, -122.420209))
    court3Center = overlayProjection.fromLatLngToDivPixel(new google.maps.LatLng(37.801569, -122.420041))
    court4Center = overlayProjection.fromLatLngToDivPixel(new google.maps.LatLng(37.801588, -122.419892))

    cornerLatLon = overlayProjection.fromDivPixelToLatLng(new google.maps.Point(0, 0));
    offSetLatLon = overlayProjection.fromDivPixelToLatLng(new google.maps.Point(10000, 0));

    # now figure out meter distance of 500 pixels based on long difference
    offsetMeters = google.maps.geometry.spherical.computeDistanceBetween(cornerLatLon, offSetLatLon);
    # assuming for the sake of drawing at close range that both x and y pixels represent the same distance per pixel
    metersPerPixel = offsetMeters / 10000;

    new TennisCourt(@paper, court1Center, -8, metersPerPixel).paint()
    court2 = new TennisCourt(@paper, court2Center, -8, metersPerPixel)
    court2.setDoubles(true)
    court2.paint()
    court3 = new TennisCourt(@paper, court3Center, -8, metersPerPixel)
    court3.setDoubles(true)
    court3.paint()
    new TennisCourt(@paper, court4Center, -8, metersPerPixel).paint()
