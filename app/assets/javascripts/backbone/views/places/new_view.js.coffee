TravelBackbone.Views.Places ||= {}

class TravelBackbone.Views.Places.NewView extends Backbone.View
  template: JST["backbone/templates/places/new"]

  events:
    "submit #new-place": "save"

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
      success: (place) =>
        @model = place
        @places = new TravelBackbone.Collections.PlacesCollection()
        @places.fetch()
        window.location.hash = "#/places"

      error: (place, jqXHR) =>
        @model.set({errors: $.parseJSON(jqXHR.responseText)})
    )


  render: ->
    @$el.html(@template(@model.toJSON() ))

    this.$("form").backboneLink(@model)

    return this
