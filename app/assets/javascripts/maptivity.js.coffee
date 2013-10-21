$ ->
  initClasses()
  Maptivity.initialize()

initClasses = ->
  google.maps.visualRefresh = true;
  google.maps.event.addDomListener(window, 'load', initMaps);


  class TennisCourtOverlay extends google.maps.OverlayView
    constructor: (@bounds, @map) ->
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

      @div=div


      console.log("i'm getting removed")
    onRemove: ->
#      @div.parentNode.removeChild(@div);
#      @div = null;

    draw: ->

      map = $("#map-canvas")

      overlayProjection = @getProjection();


      # adjusts the div in the overlay, but then drawing on it is messed

      console.log('drawing')

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

      court1Center = new google.maps.LatLng(37.801534, -122.420358);
      court2Center = new google.maps.LatLng(37.801553, -122.420211);
      court3Center = new google.maps.LatLng(37.801571, -122.420042);
      court4Center = new google.maps.LatLng(37.801588, -122.419892);




      cornerLatLon = overlayProjection.fromDivPixelToLatLng(new google.maps.Point(0,0));
      offSetLatLon = overlayProjection.fromDivPixelToLatLng(new google.maps.Point(500,0));

      # now figure out meter distance of 500 pixels based on long difference
      offsetMeters = google.maps.geometry.spherical.computeDistanceBetween(cornerLatLon, offSetLatLon);
      # assuming for the sake of drawing at close range that both x and y pixels represent the same distance per pixel
      metersPerPixel = offsetMeters / 500;

      @drawCourt(@paper, court1Center, -8, overlayProjection, metersPerPixel, sw.x, ne.y);
      @drawCourt(@paper, court2Center, -8, overlayProjection, metersPerPixel, sw.x, ne.y);
      @drawCourt(@paper, court3Center, -8, overlayProjection, metersPerPixel, sw.x, ne.y);
      @drawCourt(@paper, court4Center, -8, overlayProjection, metersPerPixel, sw.x, ne.y);

    drawCourt: (paper, centerLatLon, rotation, overlayProjection, metersPerPixel, xoffset, yoffset) ->
      # official court measurements are in feet, but we want meters
      # 1 foot = 0.3048 meters
      width = 36 * 0.3048;
      height = 78 * 0.3048;


      pixelWidth = width / metersPerPixel;
      pixelHeight = height / metersPerPixel;

      centerPoint = overlayProjection.fromLatLngToDivPixel(centerLatLon);
      topLeftCornerPoint = new google.maps.Point(centerPoint.x - (width / 2 / metersPerPixel), centerPoint.y - (height / 2 / metersPerPixel));

      rect = paper.rect(topLeftCornerPoint.x - xoffset, topLeftCornerPoint.y - yoffset, pixelWidth, pixelHeight);
      rect.attr("stroke", "#0000FF")
      rect.transform("r-8");

  window.TennisCourtOverlay = TennisCourtOverlay



initMaps = ->
  console.log('inittting maps')


  mapOptions =
    zoom: 19
    center: new google.maps.LatLng(37.8012, -122.42)
    mapTypeId: google.maps.MapTypeId.HYBRID
    tilt: 0

  map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);


  swBound = new google.maps.LatLng(62.281819, -150.287132);
  neBound = new google.maps.LatLng(62.400471, -150.005608);
  bounds = new google.maps.LatLngBounds(swBound, neBound);

  window.myOverlay = new TennisCourtOverlay bounds, map

  google.maps.event.addListener map, "idle", ->
   window.myOverlay.draw();





window.Maptivity =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    console.log('Hello from Backbone!')


#class Animal
#  constructor: (@name) ->
#
#  move: (meters) ->
#    alert @name + " moved #{meters}m."
#
#class Snake extends Animal
#  move: ->
#    alert "Slithering..."
#    super 5
#
#class Horse extends Animal
#  move: ->
#    alert "Galloping..."
#    super 45
#
#sam = new Snake "Sammy the Python"
#tom = new Horse "Tommy the Palomino"
#
#sam.move()
#tom.move()



