class Dialog < ActiveRecord::Base
  attr_accessible :billboard_id, :parent, :text, :user_id
  
  belongs_to :billboard
  belongs_to :user
  validates_presence_of :text
  
end
