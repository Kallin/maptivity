describe "Shape", ->
  it "Should do conversions properly", ->

    shape = new Shape()
    console.log(shape.metersToPixels(1))
    console.log(shape.feetToPixels(1))
    console.log(shape.yardsToPixels(1))
    console.log(shape.yardsToMeters(1))
    console.log(shape.feetToMeters(1))
    console.log(shape.getCircletoPath(0,0,10))


