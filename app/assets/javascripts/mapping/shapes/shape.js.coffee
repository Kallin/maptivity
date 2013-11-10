class @Shape
  constructor: (@paper, @anchorPoint, @rotation, @metersPerPixel, @zoom) ->

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

  strokeAndRotate:(lines) ->
    strokeWidth = switch
      when @zoom >19 then 3
      when @zoom >17 then 2
      else 1
    lines.attr("stroke-width", strokeWidth)

    lines.transform("r#{@rotation},#{@anchorPoint.x},#{@anchorPoint.y}")

