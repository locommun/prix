class DateTimeSuggestion < ActiveRecord::Base
  attr_accessible :announcement_id, :datetime
  belongs_to :announcement
  acts_as_voteable
end
