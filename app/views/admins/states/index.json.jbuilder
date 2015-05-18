json.array!(@states) do |state|
  json.extract! state, :id, :name, :description, :code
  json.url admins_state_url(state, format: :json)
end
