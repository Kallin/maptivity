class @TennisCourt
  constructor: (@paper, @centerPoint, @rotation, @metersPerPixel) ->

  paint: () ->
    # 1 foot = 0.3048 meters
    width = 36 * 0.3048;
    height = 78 * 0.3048;

    pixelWidth = width / @metersPerPixel;
    pixelHeight = height / @metersPerPixel;

    topLeftCornerPoint = new google.maps.Point(@centerPoint.x - (width / 2 / @metersPerPixel), @centerPoint.y - (height / 2 / @metersPerPixel));

    rect = @paper.rect(topLeftCornerPoint.x, topLeftCornerPoint.y, pixelWidth, pixelHeight);
    rect.attr("stroke", "#0000FF")
    rect.transform("r-8");
