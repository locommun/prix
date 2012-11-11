class AddBillboardIdToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements , :billboard_id, :integer
  end
end
