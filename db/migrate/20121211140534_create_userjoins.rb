class CreateUserjoins < ActiveRecord::Migration
  def change
    create_table :userjoins do |t|
      t.integer :user_id
      t.integer :announcement_id

      t.timestamps
    end
  end
end
