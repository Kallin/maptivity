class @TennisCourt
  constructor: (@paper, @centerPoint, @rotation, @metersPerPixel) ->

  setDoubles: (@isDoubles) ->

  paint: () ->
    # 1 foot = 0.3048 meters
    width = @metersToPixels(27 * 0.3048);
    height = @metersToPixels(78 * 0.3048);
    baselineToServiceLine = @metersToPixels(18 * 0.3048)
    doublesWidth = @metersToPixels(4.5 * 0.3048)

    origin = new google.maps.Point(@centerPoint.x - (width / 2), @centerPoint.y - (height / 2));

    courtBorder = "M#{origin.x},#{origin.y}H#{origin.x + width}V#{origin.y + height}H#{origin.x}V#{origin.y}"
    serviceBox1 = "M#{origin.x},#{origin.y + baselineToServiceLine}H#{origin.x + width}"
    serviceBox2 = "M#{origin.x},#{origin.y + height - baselineToServiceLine}H#{origin.x + width}"
    serviceBoxConnector = "M#{@centerPoint.x},#{origin.y + baselineToServiceLine}V#{origin.y + height - baselineToServiceLine}"
    serviceBoxes = serviceBox1 + serviceBox2 + serviceBoxConnector

    courtLines = courtBorder + serviceBoxes
    if @isDoubles
      courtLines += "M#{origin.x - doublesWidth},#{origin.y}H#{origin.x + width + doublesWidth}V#{origin.y + height}H#{origin.x - doublesWidth}V#{origin.y}"


    console.log(courtLines)
    lines = @paper.path(courtLines);

    lines.attr("stroke-opacity", "1.0")
    lines.attr("fill-opacity", "0.5")
    lines.attr("stroke-width", "2")
    lines.attr("stroke", "#FFFFFF")
    lines.attr("fill", "#00FF00")
    lines.transform("r-8.5,#{@centerPoint.x},#{@centerPoint.y}")

  metersToPixels: (meters) ->
    return meters / @metersPerPixel

