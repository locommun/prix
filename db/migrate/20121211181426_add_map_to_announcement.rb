class AddMapToAnnouncement < ActiveRecord::Migration
  def change
    add_column :announcements, :gmaps, :boolean
    add_column :announcements, :latitude, :float
    add_column :announcements, :longitude, :float
  end
end
