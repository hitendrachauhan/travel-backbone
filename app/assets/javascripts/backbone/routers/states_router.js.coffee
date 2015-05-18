class TravelBackbone.Routers.StatesRouter extends Backbone.Router
  initialize: (options) ->
    @states = new TravelBackbone.Collections.StatesCollection()
    @states.fetch()
    @states.reset options.states
    

  routes:
    "index"    : "index"
    "#"        : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"       : "index"

  index: ->
    @view = new TravelBackbone.Views.States.IndexView(states: @states)
    $("#states").html(@view.render().el)

  show: (id) ->
    state = @states.get(id)

    @view = new TravelBackbone.Views.States.ShowView(model: state)
    $("#states").html(@view.render().el)
