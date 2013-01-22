class AddDatetimeToAnnouncements < ActiveRecord::Migration
  def change
    add_column :announcements, :datetime, :datetime
    add_column :announcements, :datetime_module, :boolean
  end
end
