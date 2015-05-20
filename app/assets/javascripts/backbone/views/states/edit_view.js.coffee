TravelBackbone.Views.States ||= {}

class TravelBackbone.Views.States.EditView extends Backbone.View
  template: JST["backbone/templates/states/edit"]

  events:
    "submit #edit-state": "update"

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success: (state) =>
        @model = state
        window.location.hash = "/#{@model.id}"
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
