json.array!(@places) do |place|
  json.extract! place, :id, :name, :description, :district_id, :state_id
  json.url admins_place_url(place, format: :json)
end
