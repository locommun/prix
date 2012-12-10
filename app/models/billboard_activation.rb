class BillboardActivation < ActiveRecord::Base
  attr_accessible :billboard_id, :user_id, :user, :billboard
  
  belongs_to :user
  belongs_to :billboard
  
end
