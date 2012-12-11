class CreateBringthings < ActiveRecord::Migration
  def change
    create_table :bringthings do |t|
      t.integer :user_id
      t.integer :announcement_id
      t.string :thing

      t.timestamps
    end
  end
end
