#= require ./shape
class @HandballCourt extends Shape

  paint: () ->
    wallWidth = @metersToPixels(6)
    backWidth = @metersToPixels(10)
    frontCourtLength = @metersToPixels(4)
    backCourtLength = @metersToPixels(3)
    cutoutWidth = (backWidth - wallWidth) / 2

    origin = new google.maps.Point(@centerPoint.x - (wallWidth/ 2), @centerPoint.y);

    perimeterPath = "M#{origin.x},#{origin.y}H#{origin.x + wallWidth}L#{origin.x + wallWidth + cutoutWidth},#{origin.y + frontCourtLength}V#{origin.y + frontCourtLength + backCourtLength}H#{origin.x - cutoutWidth}V#{origin.y + frontCourtLength}L#{origin.x},#{origin.y}"
    #m162,212l-33,-98l164,1l-20,92l-111,5z"


    lines = @paper.path(perimeterPath)

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

