TravelBackbone.Views.Districts ||= {}

class TravelBackbone.Views.Districts.DistrictView extends Backbone.View
  template: JST["backbone/templates/districts/district"]

  events:
    "click .destroy" : "destroy"

  tagName: "tr"

  destroy: () ->
    if confirm("Are You Sure?")
      @model.destroy()
      this.remove()

    return false

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
