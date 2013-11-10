#= require ./shape
class @HandballCourtShape extends Shape

  paint: () ->
    wallWidth = @metersToPixels(6)
    backWidth = @metersToPixels(10)
    frontCourtLength = @metersToPixels(4)
    backCourtLength = @metersToPixels(3)
    cutoutWidth = (backWidth - wallWidth) / 2

    origin = new google.maps.Point(@anchorPoint.x - (wallWidth/ 2), @anchorPoint.y);

    perimeterPath = "M#{origin.x},#{origin.y}H#{origin.x + wallWidth}L#{origin.x + wallWidth + cutoutWidth},#{origin.y + frontCourtLength}V#{origin.y + frontCourtLength + backCourtLength}H#{origin.x - cutoutWidth}V#{origin.y + frontCourtLength}L#{origin.x},#{origin.y}"

    lines = @paper.path(perimeterPath)

    lines.node.setAttribute("class","handball-path");

    @strokeAndRotate(lines)

