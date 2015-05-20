class TravelBackbone.Models.Place extends Backbone.Model
  paramRoot: 'place'

  defaults:
    name: null
    description: null
    district_id: null
    code: null

  
  districtName: ->
    id = @get('district_id')
    @districts = new TravelBackbone.Collections.PlaceDistrictCollection({district_id: id})
    @districts.fetch({async: false})
    name = @districts.models[0].attributes.name
    name
    
  toTemplate: ->
    j = _(@attributes).clone()
    j.districtName = this.districtName()
    j  
    

class TravelBackbone.Collections.PlacesCollection extends Backbone.Collection
  model: TravelBackbone.Models.Place
  url: '/admins/places'

