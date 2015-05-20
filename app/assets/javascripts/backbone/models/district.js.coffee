class TravelBackbone.Models.District extends Backbone.Model
  paramRoot: 'district'

  defaults:
    name: null
    description: null
    code: null
    state_id: null

  stateName: ->
    id = @get('state_id')
    @states = new TravelBackbone.Collections.StatesCollection()
    @states.fetch()
    state = @states.get(id)
    console.log state
    return state

  toTemplate: ->
    j = _(this.attributes).clone()
    j.stateName = this.stateName()
    return j

class TravelBackbone.Collections.DistrictsCollection extends Backbone.Collection
  model: TravelBackbone.Models.District
  url: '/admins/districts'
