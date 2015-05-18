class AddStateIdToPlaces < ActiveRecord::Migration
  def change
    add_column :places, :state_id, :integer
    add_column :places, :code, :string
  end
end
