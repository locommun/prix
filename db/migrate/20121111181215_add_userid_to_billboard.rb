class AddUseridToBillboard < ActiveRecord::Migration
  def change
    add_column :billboards, :user_id, :integer
  end
end
