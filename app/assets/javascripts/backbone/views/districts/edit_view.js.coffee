TravelBackbone.Views.Districts ||= {}

class TravelBackbone.Views.Districts.EditView extends Backbone.View
  template: JST["backbone/templates/districts/edit"]

  events:
    "submit #edit-district": "update"

  update: (e) ->
    e.preventDefault()
    e.stopPropagation()

    @model.save(null,
      success: (district) =>
        @model = district
        @districts = new TravelBackbone.Collections.DistrictsCollection()
        @districts.fetch()
        window.location.hash = "#index"
    )

  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
