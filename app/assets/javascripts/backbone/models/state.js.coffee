class TravelBackbone.Models.State extends Backbone.Model
  paramRoot: 'state'

  defaults:
    name: null
    description: null
    code: null

class TravelBackbone.Collections.StatesCollection extends Backbone.Collection
  model: TravelBackbone.Models.State
  url: '/admins/states'


class TravelBackbone.Collections.StateCollection extends Backbone.Collection
  model: TravelBackbone.Models.State
  
  initialize: (options) ->
    @state_id = options.state_id

  url: ->
    '/admins/states/' + @state_id
  

