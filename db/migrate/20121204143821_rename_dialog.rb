class RenameDialog < ActiveRecord::Migration
  def up
    rename_column :dialogs, :parent, :godfather_id
  end
end
