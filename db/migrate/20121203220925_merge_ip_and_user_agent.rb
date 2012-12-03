class MergeIpAndUserAgent < ActiveRecord::Migration
  def up
   
    change_column(:user_trackings, :ip, :text)
     UserTracking.all.each do |track|
       track.update_attributes!(:ip => (track.ip + "#"+ track.useragent))
     end
    rename_column(:user_trackings, :ip, :visitor)
    remove_column(:user_trackings, :useragent)
    
  end

  def down
    add_column(:user_trackings,:useragent, :text)
    rename_column(:user_trackings, :visitor,:ip)
    UserTracking.all.each do |track|
      if !track.useragent?
       track.update_attributes!(:useragent => "deleted")
       end
     end
  end
end
