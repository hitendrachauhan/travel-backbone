TravelBackbone.Views.States ||= {}

class TravelBackbone.Views.States.NewView extends Backbone.View
  template: JST["backbone/templates/states/new"]

  events:
    "submit #new-state": "save"

  constructor: (options) ->
    super(options)
    @model = new @collection.model()

    @model.bind("change:errors", () =>
      this.render()
    )

  save: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.unset("errors")

    @collection.create(@model.toJSON(),
      success: (state) =>
        @model = state
        window.location.hash = "/#{@model.id}"

      error: (state, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
