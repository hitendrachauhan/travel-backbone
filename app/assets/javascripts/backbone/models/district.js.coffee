class TravelBackbone.Models.District extends Backbone.Model
  paramRoot: 'district'

  defaults:
    name: null
    description: null
    code: null
    state_id: null

  stateName: ->
    id = @get('state_id')
    @state = new TravelBackbone.Collections.StateCollection({state_id: id})
    @state.fetch({async: false})
    name = @state.models[0].attributes.name
    name
      
  toTemplate: ->
    j = _(this.attributes).clone()
    j.stateName = this.stateName()
    j

class TravelBackbone.Collections.DistrictsCollection extends Backbone.Collection
  model: TravelBackbone.Models.District
  url: '/admins/districts'


class TravelBackbone.Collections.DistrictCollection extends Backbone.Collection
  initialize: (options) ->
    @state_id = options.id

  model: TravelBackbone.Models.District
  url: ->
    '/admins/states/' + @state_id + '/districts'


class TravelBackbone.Collections.StateCollection extends Backbone.Collection
  model: TravelBackbone.Models.District
  
  initialize: (options) ->
    @district_id = options.district_id

  url: ->
    '/admins/districts/' + @district_id