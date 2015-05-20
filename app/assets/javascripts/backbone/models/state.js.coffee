class TravelBackbone.Models.State extends Backbone.Model
  paramRoot: 'state'

  defaults:
    name: null
    description: null
    code: null

  districts: (id) ->
    @districts = new TravelBackbone.Collections.StateDistrictCollection({state_id: id})
    @districts.fetch({async: false})
    @districts
    
  toTemplate: ->
    id = @get('id')
    j = _(@attributes).clone()
    j.districts = this.districts(id)
    j  

class TravelBackbone.Collections.StatesCollection extends Backbone.Collection
  model: TravelBackbone.Models.State
  url: '/admins/states'


class TravelBackbone.Collections.StateCollection extends Backbone.Collection
  model: TravelBackbone.Models.State
  
  initialize: (options) ->
    @state_id = options.state_id

  url: ->
    '/admins/states/' + @state_id
  

class TravelBackbone.Collections.StateDistrictCollection extends Backbone.Collection
  model: TravelBackbone.Models.District

  initialize: (options) ->
    @state_id = options.state_id

  url: ->
    '/admins/states/' + @state_id + '/districts'

