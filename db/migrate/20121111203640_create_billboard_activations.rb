class CreateBillboardActivations < ActiveRecord::Migration
  def change
    create_table :billboard_activations do |t|
      t.integer :billboard_id
      t.integer :user_id

      t.timestamps
    end
  end
end
