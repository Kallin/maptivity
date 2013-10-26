class @Shape
  constructor: (@paper, @centerPoint, @rotation, @metersPerPixel, @zoom) ->

  metersToPixels: (meters) ->
    return meters / @metersPerPixel

  feetToPixels:(feet) ->
    return @metersToPixels(@feetToMeters(feet))

  yardsToPixels:(yards) ->
    return @metersToPixels(@yardsToMeters(yards))

  yardsToMeters: (yards) ->
    return yards * 0.9144

  feetToMeters: (feet) ->
    return feet * 0.3048

  getCircletoPath:(x, y, r) ->
    return "M#{x},#{y-r}A#{r},#{r},0,1,1,#{x-0.1},#{y-r} z"

