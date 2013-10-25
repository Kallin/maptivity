class @SoccerPitch extends Shape

  paint: () ->

    lines = @paper.rect(@centerPoint.x, @centerPoint.y, 30, 50);

    lines.attr("stroke-opacity", "0.5")
    lines.attr("fill-opacity", "0.3")
    strokeWidth = switch
      when @zoom >19 then 3
      when @zoom >17 then 2
      else 1
    lines.attr("stroke-width", strokeWidth)
    lines.attr("stroke", "#FFFFFF")
    lines.attr("fill", "#FF00")
    lines.transform("r#{@rotation},#{@centerPoint.x},#{@centerPoint.y}")