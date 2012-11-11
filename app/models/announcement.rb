class Announcement < ActiveRecord::Base
  attr_accessible :description, :name, :billboard_id
  belongs_to :billboard
  has_many :comments
end
