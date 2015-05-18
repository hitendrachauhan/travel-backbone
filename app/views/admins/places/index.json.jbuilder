json.array!(@places) do |place|
  json.extract! place, :id, :name, :description
  json.url admins_place_url(place, format: :json)
end
