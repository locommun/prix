class CreateUserTrackings < ActiveRecord::Migration
  def change
    create_table :user_trackings do |t|
      t.string :url
      t.string :ip
      t.string :useragent

      t.timestamps
    end
  end
end
