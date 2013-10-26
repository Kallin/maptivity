class @SoccerPitch extends Shape

  paint: () ->
    width = @yardsToPixels(50)
    length = @yardsToPixels(100)

    origin = new google.maps.Point(@centerPoint.x - (width / 2), @centerPoint.y - (length / 2));

    perimeterPath = "M#{origin.x},#{origin.y}H#{origin.x + width}V#{origin.y + length}H#{origin.x}V#{origin.y}"
    centerCirclePath = @getCircletoPath(@centerPoint.x, @centerPoint.y, @yardsToPixels(10))

    lines = @paper.path(perimeterPath + centerCirclePath)

    lines.attr("stroke-opacity", "1")
    lines.attr("fill-opacity", "0.3")
    strokeWidth = switch
      when @zoom >19 then 3
      when @zoom >17 then 2
      else 1
    lines.attr("stroke-width", strokeWidth)
    lines.attr("stroke", "#FFFFFF")
    lines.attr("fill", "#FF0000")
    lines.transform("r#{@rotation},#{@centerPoint.x},#{@centerPoint.y}")

