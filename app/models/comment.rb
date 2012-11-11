class Comment < ActiveRecord::Base
  attr_accessible :text, :announcement_id, :user
  belongs_to :announcement
  belongs_to :user
  validates_presence_of :text
end
