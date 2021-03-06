class TravelBackbone.Routers.StatesRouter extends Backbone.Router
  initialize: (options) ->
    @states = new TravelBackbone.Collections.StatesCollection()
    @states.reset options.states

  routes:
    "new"      : "newState"
    "states"    : "index"
    "states/:id/edit" : "edit"
    "states/:id"      : "show"
    ".*"        : "index"

  newState: ->
    @view = new TravelBackbone.Views.States.NewView(collection: @states)
    $("#states").html(@view.render().el)

  index: ->
    @view = new TravelBackbone.Views.States.IndexView(states: @states)
    $("#states").html(@view.render().el)

  show: (id) ->
    state = @states.get(id)

    @view = new TravelBackbone.Views.States.ShowView(model: state)
    $("#states").html(@view.render().el)

  edit: (id) ->
    state = @states.get(id)

    @view = new TravelBackbone.Views.States.EditView(model: state)
    $("#edit-state-" + id).html(@view.render().el)
