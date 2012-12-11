class Bringthing < ActiveRecord::Base
  attr_accessible :announcement_id, :thing, :user_id
  
  belongs_to :user
  belongs_to :announcement
  
  validates :thing, :length => {:minimum => 2}
  
end
