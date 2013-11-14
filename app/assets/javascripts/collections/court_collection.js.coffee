class @CourtCollection extends Backbone.Collection
  model: CourtModel
  url: '/courts/show'

  newCourt = null

  initialize: ->
    window.MyApp.vent.on 'latlng:update', @addCourt

  addCourt: (evt) =>

    if (newCourt)
      newCourt.stopListening window.MyApp.vent, "builder:rotate"

    window.MyApp.builder.show(new BuilderView());

    newCourt = new CourtModel({lat: evt.lat(), lng: evt.lng(), rotation: 0})
    newCourt.listenTo window.MyApp.vent, 'builder:rotate', newCourt.rotate

    @add(newCourt)