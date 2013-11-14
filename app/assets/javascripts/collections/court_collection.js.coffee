class @CourtCollection extends Backbone.Collection
  model: TennisCourtModel
  url: '/courts/show'

  initialize: ->
    window.MyApp.vent.on 'latlng:update', @addCourt

  addCourt: (evt) =>
    @add(new TennisCourtModel({lat: evt.lat(), lng: evt.lng(), rotation: 0}))
