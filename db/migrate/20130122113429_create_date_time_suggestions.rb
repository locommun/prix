class CreateDateTimeSuggestions < ActiveRecord::Migration
  def change
    create_table :date_time_suggestions do |t|
      t.datetime :datetime
      t.string :announcement_id

      t.timestamps
    end
  end
end
