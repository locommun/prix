class MergeIpAndUserAgent < ActiveRecord::Migration
  def up
   
    change_column(:user_trackings, :ip, :text)
    rename_column(:user_trackings, :ip, :visitor)
    remove_column(:user_trackings, :useragent)
    
  end

  def down
    add_column(:user_trackings,:useragent, :text)
    rename_column(:user_trackings, :visitor,:ip)
  end
end
