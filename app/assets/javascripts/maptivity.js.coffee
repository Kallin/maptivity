$(document).ready ->
  initClasses()
  Maptivity.initialize()

initClasses = ->

  google.maps.event.addDomListener(window, 'load', initMaps);

  console.log('initing!')

  class MaOverlay extends google.maps.OverlayView
    initialize ->
      console.log('there is no init method!')

initMaps = ->
  console.log('inittting maps')





window.Maptivity =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    console.log('Hello from Backbone!')










#class Animal
#  constructor: (@name) ->
#
#  move: (meters) ->
#    alert @name + " moved #{meters}m."
#
#class Snake extends Animal
#  move: ->
#    alert "Slithering..."
#    super 5
#
#class Horse extends Animal
#  move: ->
#    alert "Galloping..."
#    super 45
#
#sam = new Snake "Sammy the Python"
#tom = new Horse "Tommy the Palomino"
#
#sam.move()
#tom.move()



