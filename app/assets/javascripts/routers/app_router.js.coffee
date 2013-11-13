#= require ./controller
class @MarRouter extends Backbone.Marionette.AppRouter

  appRoutes :
    "activity/:activity": "activity",
    '*path': 'defaultRoute'

  controller: new MarController()
