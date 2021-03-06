class TravelBackbone.Routers.DistrictsRouter extends Backbone.Router
  initialize: (options) ->
    @districts = new TravelBackbone.Collections.DistrictsCollection()
    @districts.fetch()
    @districts.reset options.districts

  routes:
    "new"      : "newDistrict"
    "districts"    : "index"
    "#"        : "index"
    "districts/:id/edit" : "edit"
    "districts/:id"      : "show"
    ".*"       : "index"
    "districts": "index"

  newDistrict: ->
  
    @view = new TravelBackbone.Views.Districts.NewView(collection: @districts)
    $("#new-district").html(@view.render().el)

  index: ->
    @view = new TravelBackbone.Views.Districts.IndexView(districts: @districts)
    $("#content").html(@view.render().el)

  show: (id) ->
    district = @districts.get(id)

    @view = new TravelBackbone.Views.Districts.ShowView(model: district)
    $("#content").html(@view.render().el)

  edit: (id) ->
    district = @districts.get(id)

    @view = new TravelBackbone.Views.Districts.EditView(model: district)
    $("#new-district-" + id).html(@view.render().el)

  list: (id) ->
    @districts = new TravelBackbone.Collections.DistrictsCollection()
    @districts.fetch()
    @district = @districts.get(id)
