class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.string :name
      t.text :description
      t.string :code
      t.string :state_type

      t.timestamps
    end
  end
end
