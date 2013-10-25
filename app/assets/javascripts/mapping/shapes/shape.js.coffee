class @Shape
  constructor: (@paper, @centerPoint, @rotation, @metersPerPixel, @zoom) ->

  metersToPixels: (meters) ->
    return meters / @metersPerPixel