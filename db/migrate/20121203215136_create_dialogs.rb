class CreateDialogs < ActiveRecord::Migration
  def change
    create_table :dialogs do |t|
      t.integer :user_id
      t.integer :billboard_id
      t.text :text
      t.integer :parent

      t.timestamps
    end
  end
end
