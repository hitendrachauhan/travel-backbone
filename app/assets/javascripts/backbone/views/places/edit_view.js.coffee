TravelBackbone.Views.Places ||= {}

class TravelBackbone.Views.Places.EditView extends Backbone.View
  template: JST["backbone/templates/places/edit"]

  events:
    "submit #edit-place": "update"

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success: (place) =>
        @model = place
        window.location.hash = "/#{@model.id}"
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
