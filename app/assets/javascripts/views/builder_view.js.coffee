class @BuilderView extends Backbone.Marionette.ItemView

  template: JST["builder"]

  onDomRefresh: => # maybe after render?
    $('.modal').modal({backdrop: false}) # todo: activate using EL
    $('.slider').slider({ max: 360, step: 0.5 })
    $('.slider').on "slide", (event, ui) =>
      $(".sliderValue").html(ui.value)
      window.MyApp.vent.trigger('builder:rotate', ui.value);