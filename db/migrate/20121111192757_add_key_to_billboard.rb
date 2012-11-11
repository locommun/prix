class AddKeyToBillboard < ActiveRecord::Migration
  def change
    add_column :billboards, :key, :string
  end
end
