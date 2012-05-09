#= require ./lib/jquery
#= require ./lib/json2
#= require ./lib/spine/spine
#= require ./lib/spine/manager
#= require ./lib/spine/ajax
#= require ./lib/spine/route

#= require ./app/config/namespace
#= require_tree ./app/controllers
#= require_tree ./app/models
#= require_tree ./app/views
#= require_tree ./app/config
#= require ./app/index

$(document).ready -> new App.Index({ el:"#app" })