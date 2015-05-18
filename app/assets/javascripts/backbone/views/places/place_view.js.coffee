TravelBackbone.Views.Places ||= {}

class TravelBackbone.Views.Places.PlaceView extends Backbone.View
  template: JST["backbone/templates/places/place"]

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
