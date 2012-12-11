class Userjoin < ActiveRecord::Base
  attr_accessible :announcement_id, :user_id, :user, :announcement
  
  belongs_to :user
  belongs_to :announcement
  
  
end
