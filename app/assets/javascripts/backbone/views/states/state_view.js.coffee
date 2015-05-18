TravelBackbone.Views.States ||= {}

class TravelBackbone.Views.States.StateView extends Backbone.View
  template: JST["backbone/templates/states/state"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    if confirm("Are You Sure?")
      @model.destroy()
      this.remove()

    return false

  render: ->
    @$el.html(@options.model.toJSON().name)
    return this

