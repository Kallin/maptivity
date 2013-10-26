class @TennisCourt extends Shape


  setDoubles: (@isDoubles) ->

  paint: () ->
    width = @feetToPixels(27);
    length = @feetToPixels(78);
    baselineToServiceLine = @feetToPixels(18);
    doublesWidth = @feetToPixels(4.5);

    origin = new google.maps.Point(@centerPoint.x - (width / 2), @centerPoint.y - (length / 2));

    courtBorder = "M#{origin.x},#{origin.y}H#{origin.x + width}V#{origin.y + length}H#{origin.x}V#{origin.y}"
    serviceBox1 = "M#{origin.x},#{origin.y + baselineToServiceLine}H#{origin.x + width}"
    serviceBox2 = "M#{origin.x},#{origin.y + length - baselineToServiceLine}H#{origin.x + width}"
    serviceBoxConnector = "M#{@centerPoint.x},#{origin.y + baselineToServiceLine}V#{origin.y + length - baselineToServiceLine}"
    serviceBoxes = serviceBox1 + serviceBox2 + serviceBoxConnector

    courtLines = courtBorder + serviceBoxes
    if @isDoubles
      courtLines += "M#{origin.x - doublesWidth},#{origin.y}H#{origin.x + width + doublesWidth}V#{origin.y + length}H#{origin.x - doublesWidth}V#{origin.y}"

    lines = @paper.path(courtLines);

    lines.attr("stroke-opacity", "0.5")
    lines.attr("fill-opacity", "0.3")
    strokeWidth = switch
      when @zoom >19 then 3
      when @zoom >17 then 2
      else 1
    lines.attr("stroke-width", strokeWidth)
    lines.attr("stroke", "#FFFFFF")
    lines.attr("fill", "#00FF00")
    lines.transform("r#{@rotation},#{@centerPoint.x},#{@centerPoint.y}")



