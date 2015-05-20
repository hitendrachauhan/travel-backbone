class TravelBackbone.Routers.PlacesRouter extends Backbone.Router
  initialize: (options) ->
    @places = new TravelBackbone.Collections.PlacesCollection()
    @places.fetch()
    @places.reset options.places

  routes:
    "new"      : "newPlace"
    "places"    : "index"
    "places/:id/edit" : "edit"
    "places/:id"      : "show"
    ".*"       : "index"

  newPlace: ->
    @view = new TravelBackbone.Views.Places.NewView(collection: @places)
    $("#new-place").html(@view.render().el)

  index: ->
    @view = new TravelBackbone.Views.Places.IndexView(places: @places)
    $("#places").html(@view.render().el)

  show: (id) ->
    place = @places.get(id)

    @view = new TravelBackbone.Views.Places.ShowView(model: place)
    $("#content").html(@view.render().el)

  edit: (id) ->
    place = @places.get(id)

    @view = new TravelBackbone.Views.Places.EditView(model: place)
    $("#new-place" + id).html(@view.render().el)
