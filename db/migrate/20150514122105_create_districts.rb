class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.string :name
      t.text :description
      t.string :code
      t.integer :state_id

      t.timestamps
    end
  end
end
