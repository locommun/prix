class AddLocationToAnnouncement < ActiveRecord::Migration
  def change
    add_column :announcements, :location, :text
  end
end
