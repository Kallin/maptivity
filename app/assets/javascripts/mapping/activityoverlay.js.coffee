class @ActivityOverlayView extends google.maps.OverlayView
  constructor: (@map) ->
    @div = null
    @paper = null
    @setMap(@map)
    @courts = []

  onAdd: ->
    @div = document.createElement('div')
    @div.style.position = 'absolute';
    @getPanes().overlayLayer.appendChild(@div)

  onRemove: ->
#      @div.parentNode.removeChild(@div);
#      @div = null;

  setCourts:(courts) ->
    @courts= courts

  draw: ->
    map = $("#map-canvas")

    overlayProjection = @getProjection();

    bounds = @getMap().getBounds()

    if (!bounds?)
      return

    sw = overlayProjection.fromLatLngToDivPixel(bounds.getSouthWest());
    ne = overlayProjection.fromLatLngToDivPixel(bounds.getNorthEast());

    overDraw = 200

    @div.style.left = sw.x - overDraw + 'px';
    @div.style.top = ne.y - overDraw + 'px';
    @div.style.width = (ne.x - sw.x) + overDraw * 2 + 'px';
    @div.style.height = (sw.y - ne.y) + overDraw * 2 + 'px';

    if (!@paper)
      @paper = new Raphael(@div, map.width() + overDraw * 2, map.height() + overDraw * 2);

    @paper.clear()

    @paper.setViewBox(sw.x - overDraw, ne.y - overDraw, map.width() + overDraw * 2, map.height() + overDraw * 2)

    pitch1Center = overlayProjection.fromLatLngToDivPixel(new google.maps.LatLng(37.804855, -122.42437))

    cornerLatLon = overlayProjection.fromDivPixelToLatLng(new google.maps.Point(0, 0));
    offSetLatLon = overlayProjection.fromDivPixelToLatLng(new google.maps.Point(1, 0));
    # now figure out meter distance of 500 pixels based on long difference
    # assuming for the sake of drawing at close range that both x and y pixels represent the same distance per pixel
    metersPerPixel = google.maps.geometry.spherical.computeDistanceBetween(cornerLatLon, offSetLatLon);

    @paintCourt(court, metersPerPixel) for court in @courts

    new SoccerPitch(@paper, pitch1Center, 81, metersPerPixel, @getMap().getZoom()).paint()

    hanball1Center = overlayProjection.fromLatLngToDivPixel(new google.maps.LatLng(43.668236, -79.41549))
    new HandballCourt(@paper, hanball1Center, 75, metersPerPixel, @getMap().getZoom()).paint()

    hanball1Center = overlayProjection.fromLatLngToDivPixel(new google.maps.LatLng(43.66788, -79.41540))
    new HandballCourt(@paper, hanball1Center, -16, metersPerPixel, @getMap().getZoom()).paint()

    hanball1Center = overlayProjection.fromLatLngToDivPixel(new google.maps.LatLng(43.67092829817012, -79.40257340669632))
    new HandballCourt(@paper, hanball1Center, 164, metersPerPixel, @getMap().getZoom()).paint()

  paintCourt:(courtData, metersPerPixel) ->
    centerPoint = @getProjection().fromLatLngToDivPixel(new google.maps.LatLng(courtData.get('lat'), courtData.get('lng')))
    courtShape = new TennisCourtShape(@paper, centerPoint, courtData.get('rotation'), metersPerPixel, @getMap().getZoom())
    courtShape.setDoubles(courtData.get('isDoubles'))
    courtShape.paint()