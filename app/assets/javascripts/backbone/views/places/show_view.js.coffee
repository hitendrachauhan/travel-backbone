TravelBackbone.Views.Places ||= {}

class TravelBackbone.Views.Places.ShowView extends Backbone.View
  template: JST["backbone/templates/places/show"]

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
