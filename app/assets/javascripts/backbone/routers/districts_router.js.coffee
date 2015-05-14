class TravelBackbone.Routers.DistrictsRouter extends Backbone.Router
  initialize: (options) ->
    @districts = new TravelBackbone.Collections.DistrictsCollection()
    @districts.fetch()
    @districts.reset options.districts

  routes:
    "new"      : "newDistrict"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newDistrict: ->
    @view = new TravelBackbone.Views.Districts.NewView(collection: @districts)
    $("#districts").html(@view.render().el)

  index: ->
    @view = new TravelBackbone.Views.Districts.IndexView(districts: @districts)
    $("#districts").html(@view.render().el)

  show: (id) ->
    district = @districts.get(id)

    @view = new TravelBackbone.Views.Districts.ShowView(model: district)
    $("#districts").html(@view.render().el)

  edit: (id) ->
    district = @districts.get(id)

    @view = new TravelBackbone.Views.Districts.EditView(model: district)
    $("#districts").html(@view.render().el)