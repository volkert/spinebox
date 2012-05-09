class App.Root extends Spine.Controller
  constructor: ->
    super
    @render()
  
  render: ->
    @html JST['app/views/root'](@)