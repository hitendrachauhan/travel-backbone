TravelBackbone.Views.Districts ||= {}

class TravelBackbone.Views.Districts.IndexView extends Backbone.View
  template: JST["backbone/templates/districts/index"]

  initialize: () ->
    @options.districts.bind('reset', @render, this)

  addAll: () =>
    @options.districts.each(@addOne)

  addOne: (district) =>
    view = new TravelBackbone.Views.Districts.DistrictView({model : district})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(districts: @options.districts.toJSON() ))
    @addAll()

    return this
