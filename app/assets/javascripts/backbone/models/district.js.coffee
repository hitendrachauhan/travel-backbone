class TravelBackbone.Models.District extends Backbone.Model
  paramRoot: 'district'

  defaults:
    name: null
    description: null
    code: null

class TravelBackbone.Collections.DistrictsCollection extends Backbone.Collection
  model: TravelBackbone.Models.District
  url: '/admins/districts'
