class UserTracking < ActiveRecord::Base
  attr_accessible :ip, :url, :useragent
end
