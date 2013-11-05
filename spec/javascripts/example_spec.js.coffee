describe "Shape", ->
  it "Should do conversions properly", ->

    shape = new Shape()

    console.log(shape.metersToPixels(1))
    console.log(shape.feetToPixels(1))
    console.log(shape.yardsToPixels(1))
    console.log(shape.yardsToMeters(1))
    console.log(shape.feetToMeters(1))
    console.log(shape.getCircletoPath(0,0,10))
    expect(shape.feetToMeters(1)).toBe(0.3048);

  it 'should be incrementing in value', ->
    counter = 0
    counter++
    expect(counter).toEqual(1)

#  it 'the callback should be executed on success', ->

    #  // `andCallFake()` calls a passed function when a spy
    #  // has been called
#    spyOn($, 'ajax').callFake (options) ->
#      options.success()
#
#
#  // Create a new spy
#      callback = jasmine.createSpy();
#
#  // Exexute the spy callback if the
#  // request for Todo 15 is successful
#  getTodo(15, callback);
#
#  // Verify that the URL of the most recent call
#  // matches our expected Todo item.
#expect($.ajax.mostRecentCall.args[0]['url']).toEqual('/todos/15');
#
#  // `expect(x).toHaveBeenCalled()` will pass if `x` is a
#  // spy and was called.
#expect(callback).toHaveBeenCalled();
#});
#
#function getTodo(id, callback) {
#$.ajax({
#  type: 'GET',
#  url: '/todos/'' + id,
#          dataType: 'json',
#success: callback
#});
#}
#



