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
    new TravelBackbone.Routers.StatesRouter(states: [])
    new TravelBackbone.Routers.DistrictsRouter(districts: [])
    new TravelBackbone.Routers.PlacesRouter(places: [])
    new TravelBackbone.Routers.HomeRouter(states: [], districts: [], places: [])
    Backbone.history.start()
      
$(document).ready ->
  TravelBackbone.init()