TravelBackbone.Views.States ||= {}

class TravelBackbone.Views.States.StateView extends Backbone.View
  template: JST["backbone/templates/states/state"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    @model.destroy()
    this.remove()

    return false

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
