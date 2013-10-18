$ ->
  initClasses()
  Maptivity.initialize()

initClasses = ->
  google.maps.event.addDomListener(window, 'load', initMaps);

  console.log('initing!')

  class TennisCourtOverlay extends google.maps.OverlayView
    constructor: (@bounds, @map) ->
      console.log("i'm getting constructed yo!")
      @div_ = null
      @paper_ = null
      @setMap(@map)

    onAdd: ->
      console.log("i'm getting added yo!")
      div = document.createElement('div')
      div.style.border = 'none';
      div.style.borderWidth = '0px';
      div.style.position = 'absolute';
      div.className = "someclass";
      @div_=div

      panes = @getPanes()
      panes.overlayImage.appendChild(@div_)

    draw: ->
      console.log("time to draw, bitch!")
      if (@paper_)
        @paper.clear

      map = $("#map-canvas")
      @paper_ = new Raphael(@div_, map.width(), map.height());

      court1Center = new google.maps.LatLng(37.801534, -122.420358);
      court2Center = new google.maps.LatLng(37.801553, -122.420211);
      court3Center = new google.maps.LatLng(37.801571, -122.420042);
      court4Center = new google.maps.LatLng(37.801590, -122.419892);


      overlayProjection = this.getProjection();

      cornerLatLon = overlayProjection.fromDivPixelToLatLng(new google.maps.Point(0,0));
      offSetLatLon = overlayProjection.fromDivPixelToLatLng(new google.maps.Point(500,0));

      # now figure out meter distance of 500 pixels based on long difference
      offsetMeters = google.maps.geometry.spherical.computeDistanceBetween(cornerLatLon, offSetLatLon);
      # assuming for the sake of drawing at close range that both x and y pixels represent the same distance per pixel
      metersPerPixel = offsetMeters / 500;

      @drawCourt(@paper_, court1Center, -8, overlayProjection, metersPerPixel);
      @drawCourt(@paper_, court2Center, -8, overlayProjection, metersPerPixel);
      @drawCourt(@paper_, court3Center, -8, overlayProjection, metersPerPixel);
      @drawCourt(@paper_, court4Center, -8, overlayProjection, metersPerPixel);

    drawCourt: (paper, centerLatLon, rotation, overlayProjection, metersPerPixel) ->
      # official court measurements are in feet, but we want meters
      # 1 foot = 0.3048 meters
      width = 36 * 0.3048;
      height = 78 * 0.3048;


      pixelWidth = width / metersPerPixel;
      pixelHeight = height / metersPerPixel;

      centerPoint = overlayProjection.fromLatLngToDivPixel(centerLatLon);
      topLeftCornerPoint = new google.maps.Point(centerPoint.x - (width / 2 / metersPerPixel), centerPoint.y - (height / 2 / metersPerPixel));

      rect = paper.rect(topLeftCornerPoint.x, topLeftCornerPoint.y, pixelWidth, pixelHeight);
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

  new TennisCourtOverlay bounds, map


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



