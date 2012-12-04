class Dialogcomment < ActiveRecord::Base
  attr_accessible :dialog_id, :text, :user_id
  
  belongs_to :dialog
  belongs_to :user
  validates_presence_of :text
  
end
