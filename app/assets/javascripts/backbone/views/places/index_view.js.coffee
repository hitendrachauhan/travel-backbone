TravelBackbone.Views.Places ||= {}

class TravelBackbone.Views.Places.IndexView extends Backbone.View
  template: JST["backbone/templates/places/index"]

  initialize: () ->
    @options.places.bind('reset', @addAll)

  addAll: () =>
    @options.places.each(@addOne)

  addOne: (place) =>
    view = new TravelBackbone.Views.Places.PlaceView({model : place})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(places: @options.places.toJSON() ))
    @addAll()

    return this
