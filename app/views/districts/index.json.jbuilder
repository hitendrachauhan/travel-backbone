json.array!(@districts) do |district|
  json.extract! district, :id, :name, :description, :code, :state_id
  json.url district_url(district, format: :json)
end
