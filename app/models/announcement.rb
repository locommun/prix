class Announcement < ActiveRecord::Base
  attr_accessible :description, :name, :billboard_id, :user
  belongs_to :billboard
  belongs_to :user
  has_many :comments
  
  validates_length_of :description, :minimum => 50
  validates_length_of :name, :maximum => 30
end
