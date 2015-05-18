#= require_self
#= require_tree ./templates
#= require_tree ./models
#= require_tree ./views
#= require_tree ./routers

window.TravelBackbone =
  Models: {}
  Collections: {}
  Routers: {}
  Views: {}
  init: ->
    controller = window.location.href.split('/admins/')[1]
    if controller != undefined
      if controller == 'states'
        new TravelBackbone.Routers.StatesRouter(states: [])
      if controller == 'districts'
        new TravelBackbone.Routers.DistrictsRouter(districts: [])
      if controller == 'places'
        new TravelBackbone.Routers.PlacesRouter(places: [])
    else
      new TravelBackbone.Routers.HomeRouter(states: [], districts: [], places: [])
    Backbone.history.start()
      
$(document).ready ->
  TravelBackbone.init()