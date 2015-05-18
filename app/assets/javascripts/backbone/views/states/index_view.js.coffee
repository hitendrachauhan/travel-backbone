TravelBackbone.Views.States ||= {}

class TravelBackbone.Views.States.IndexView extends Backbone.View
  template: JST["backbone/templates/states/index"]

  initialize: () ->
    @options.states.bind('reset', @addAll)

  addAll: () =>
    @options.states.each(@addOne)
    $($(".panel a")[0]).addClass("active")

  addOne: (state) =>
    view = new TravelBackbone.Views.States.StateView({model : state})

    @$(".list-group").append(view.render().el)

  render: =>
    @$el.html(@template(states: @options.states.toJSON() ))
    @addAll()

    return this
