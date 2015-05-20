TravelBackbone.Views.States ||= {}

class TravelBackbone.Views.States.ShowView extends Backbone.View
  template: JST["backbone/templates/states/show"]

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
