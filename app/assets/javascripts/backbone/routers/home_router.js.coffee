class TravelBackbone.Routers.HomeRouter extends Backbone.Router
  initialize: (options) ->
    @districts = new TravelBackbone.Collections.DistrictsCollection()
    @districts.fetch()
    @districts.reset options.districts

    @states = new TravelBackbone.Collections.StatesCollection()
    @states.fetch()
    @states.reset options.states

    @places = new TravelBackbone.Collections.PlacesCollection()
    @places.fetch()
    @places.reset options.places



  routes:
    "districts": "districts"
    "states" : "states"
    "places" : "places"

  districts: ->
    @view = new TravelBackbone.Views.Districts.IndexView(districts: @districts)
    $("#content").html(@view.render().el)

  states: ->
    @view = new TravelBackbone.Views.States.IndexView(states: @states)
    $("#content").html(@view.render().el)

  places: ->
    @view = new TravelBackbone.Views.Places.IndexView(places: @places)
    $("#content").html(@view.render().el)

