#= require ./shape
class @TennisCourtShape extends Shape

  setDoubles: (@isDoubles) ->

  paint: () ->
    width = @feetToPixels(27);
    length = @feetToPixels(78);
    baselineToServiceLine = @feetToPixels(18);
    doublesWidth = @feetToPixels(4.5);

    origin = new google.maps.Point(@anchorPoint.x - (width / 2), @anchorPoint.y - (length / 2));

    courtBorder = "M#{origin.x},#{origin.y}H#{origin.x + width}V#{origin.y + length}H#{origin.x}V#{origin.y}"
    serviceBox1 = "M#{origin.x},#{origin.y + baselineToServiceLine}H#{origin.x + width}"
    serviceBox2 = "M#{origin.x},#{origin.y + length - baselineToServiceLine}H#{origin.x + width}"
    serviceBoxConnector = "M#{@anchorPoint.x},#{origin.y + baselineToServiceLine}V#{origin.y + length - baselineToServiceLine}"
    serviceBoxes = serviceBox1 + serviceBox2 + serviceBoxConnector

    courtLines = courtBorder + serviceBoxes
    if @isDoubles
      courtLines += "M#{origin.x - doublesWidth},#{origin.y}H#{origin.x + width + doublesWidth}V#{origin.y + length}H#{origin.x - doublesWidth}V#{origin.y}"

    lines = @paper.path(courtLines);

    lines.node.setAttribute("class", "tennis-path");

    @strokeAndRotate(lines)





