class AddModul1ToAnnouncement < ActiveRecord::Migration
  def change
    add_column :announcements, :uj, :boolean
  end
end
