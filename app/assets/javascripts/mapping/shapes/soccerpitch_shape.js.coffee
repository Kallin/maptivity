#= require ./shape
class @SoccerPitchShape extends Shape

  paint: () ->
    width = @yardsToPixels(50)
    length = @yardsToPixels(100)

    origin = new google.maps.Point(@anchorPoint.x - (width / 2), @anchorPoint.y - (length / 2));

    perimeterPath = "M#{origin.x},#{origin.y}H#{origin.x + width}V#{origin.y + length}H#{origin.x}V#{origin.y}"
    centerCirclePath = @getCircletoPath(@anchorPoint.x, @anchorPoint.y, @yardsToPixels(10))

    lines = @paper.path(perimeterPath + centerCirclePath)

    lines.node.setAttribute("class", "soccer-path");

    @strokeAndRotate(lines)

