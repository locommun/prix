class Dialog < ActiveRecord::Base
  attr_accessible :billboard_id, :godfather_id, :text, :user_id, :billboard, :user
  
  belongs_to :godfather ,:class_name => 'User', :foreign_key => 'godfather_id'
  
  belongs_to :billboard
  belongs_to :user
  validates_presence_of :text
  has_many :dialogcomments
  
end
