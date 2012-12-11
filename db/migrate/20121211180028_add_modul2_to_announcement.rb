class AddModul2ToAnnouncement < ActiveRecord::Migration
  def change
    add_column :announcements, :bt, :boolean
  end
end
