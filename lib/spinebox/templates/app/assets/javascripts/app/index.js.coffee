class App.Index extends Spine.Controller
  constructor: ->
    super
    
    @append new App.Routes
    Spine.Route.setup()