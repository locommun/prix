class CreateDialogcomments < ActiveRecord::Migration
  def change
    create_table :dialogcomments do |t|
      t.integer :user_id
      t.text :text
      t.integer :dialog_id

      t.timestamps
    end
  end
end
