class @BuilderView extends Backbone.Marionette.ItemView

  template: JST["builder"]

  onDomRefresh: => # maybe after render?
    $('.modal').modal({backdrop: false}) # todo: activate using EL
    $('.slider').slider({max:360})
    $('.slider').on "slide", (event) =>
      $(".sliderValue").html(event.value)
      window.MyApp.vent.trigger('builder:rotate', event.value);