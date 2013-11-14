$ ->
  MyApp = new Backbone.Marionette.Application();
  window.MyApp = MyApp
  MyApp.addRegions({
    header: 'header',
    position: 'position',
    main: 'main',
    builder: '#builder'
  });

  MyApp.vent.on 'all', (evt, model) ->
#    console.log('DEBUG: Event Caught: ' + evt);
#    if (model)
#      console.dir(model)

  MyApp.addInitializer ->
    MyApp.header.show(new HeaderView());
    MyApp.position.show(new PositionView());
    MyApp.main.show(new MapView());

    new MarRouter();
    Backbone.history.start();

  MyApp.start();



