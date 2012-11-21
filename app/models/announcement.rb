class Announcement < ActiveRecord::Base
  attr_accessible :description, :name, :billboard_id, :user
  belongs_to :billboard
  belongs_to :user
  has_many :comments
end