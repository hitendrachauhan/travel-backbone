class TravelBackbone.Models.State extends Backbone.Model
  paramRoot: 'state'

  defaults:
    name: null
    description: null
    code: null

class TravelBackbone.Collections.StatesCollection extends Backbone.Collection
  model: TravelBackbone.Models.State
  url: '/admins/states'
