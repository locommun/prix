class UserTracking < ActiveRecord::Base
  attr_accessible :visitor, :url
end
