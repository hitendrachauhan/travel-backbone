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
    "newDistrict" : "newDistrict"
    "newPlace" : "newPlace"
    "states/:id" : "showState"
    "states/:id/edit" : "editState"

  districts: ->
    @view = new TravelBackbone.Views.Districts.IndexView(districts: @districts)
    $("#content").html(@view.render().el)

  states: ->
    @view = new TravelBackbone.Views.States.IndexView(states: @states)
    $("#content").html(@view.render().el)

  places: ->
    @view = new TravelBackbone.Views.Places.IndexView(places: @places)
    $("#content").html(@view.render().el)

  newDistrict: ->
    @view = new TravelBackbone.Views.Districts.NewView(collection: @districts)
    $("#new-district").html(@view.render().el)


  newPlace: ->
    @view = new TravelBackbone.Views.Places.NewView(collection: @places)
    $("#new-place").html(@view.render().el)

  showState: (id) ->
    state = @states.get(id)

    @view = new TravelBackbone.Views.States.ShowView(model: state)
    $("#content").html(@view.render().el)

  editState: (id) ->
    state = @states.get(id)
    @view = new TravelBackbone.Views.States.EditView(model: state)
    $("#edit-state-" + id).html(@view.render().el)
