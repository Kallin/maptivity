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
#    TODO: apparently this should be implemented

  setCourts:(@courts) ->

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

    # assuming for the sake of drawing at close range that both x and y pixels represent the same distance per pixel
    cornerLatLon = overlayProjection.fromDivPixelToLatLng(new google.maps.Point(0, 0));
    offSetLatLon = overlayProjection.fromDivPixelToLatLng(new google.maps.Point(1, 0));
    metersPerPixel = google.maps.geometry.spherical.computeDistanceBetween(cornerLatLon, offSetLatLon);

    @paintCourt(court, metersPerPixel) for court in @courts

  paintCourt:(courtData, metersPerPixel) ->
    centerPoint = @getProjection().fromLatLngToDivPixel(new google.maps.LatLng(courtData.get('lat'), courtData.get('lng')))
    courtShape = new HandballCourtShape(@paper, centerPoint, courtData.get('rotation'), metersPerPixel, @getMap().getZoom())
#    courtShape.setDoubles(courtData.get('isDoubles'))
    courtShape.paint()