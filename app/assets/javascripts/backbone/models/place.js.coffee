class TravelBackbone.Models.Place extends Backbone.Model
  paramRoot: 'place'

  defaults:
    name: null
    description: null
    code: null
    state_id: null

class TravelBackbone.Collections.PlacesCollection extends Backbone.Collection
  model: TravelBackbone.Models.Place
  url: '/admins/places'
