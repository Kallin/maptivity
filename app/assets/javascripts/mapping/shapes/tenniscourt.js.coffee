class @TennisCourt
  constructor: (@paper, @centerPoint, @rotation, @metersPerPixel) ->

  paint: () ->
    # 1 foot = 0.3048 meters
    width = 36 * 0.3048;
    height = 78 * 0.3048;

    pixelWidth = width / @metersPerPixel;
    pixelHeight = height / @metersPerPixel;

    topLeftCornerPoint = new google.maps.Point(@centerPoint.x - (width / 2 / @metersPerPixel), @centerPoint.y - (height / 2 / @metersPerPixel));

    lines = @paper.rect(topLeftCornerPoint.x, topLeftCornerPoint.y, pixelWidth, pixelHeight);
    #    lines = @paper.path("M10,20L30,40");
#    lines = @paper.path("M#{topLeftCornerPoint.x},#{topLeftCornerPoint.y}L#{pixelWidth},#{pixelHeight}");

    lines.attr("stroke-opacity", "1.0")
    lines.attr("fill-opacity", "0.1")
    lines.attr("stroke-width", "2")
    lines.attr("stroke", "#FFFFFF")
    lines.attr("fill", "#00FF00")
    lines.transform("r-8");
