TravelBackbone.Views.Districts ||= {}

class TravelBackbone.Views.Districts.ShowView extends Backbone.View
  template: JST["backbone/templates/districts/show"]

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
