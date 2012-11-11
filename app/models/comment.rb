class Comment < ActiveRecord::Base
  attr_accessible :text, :announcement_id
  belongs_to :announcement
end
