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
    controller = window.location.pathname.split('/admins/')[1]
    if controller != undefined
      if controller == 'states'
        new TravelBackbone.Routers.StatesRouter(states: [])
      else
      if controller == 'districts'
        new TravelBackbone.Routers.DistrictsRouter(districts: [])
      else
      if controller == 'places'
        new TravelBackbone.Routers.PlacesRouter(places: [])
      else
    Backbone.history.start()

$(document).ready ->
  TravelBackbone.init()  