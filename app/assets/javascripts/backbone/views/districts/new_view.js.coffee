TravelBackbone.Views.Districts ||= {}

class TravelBackbone.Views.Districts.NewView extends Backbone.View
  template: JST["backbone/templates/districts/new"]

  events:
    "submit #new-district": "save"

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
      success: (district) =>
        @model = district
        @districts = new TravelBackbone.Collections.DistrictsCollection()
        @districts.fetch()
        window.location.hash = "#index"

      error: (district, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
