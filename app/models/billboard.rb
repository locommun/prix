class Billboard < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  attr_accessible :description, :gmaps, :latitude, :longitude, :name, :user
  has_many :announcements
  belongs_to :user
  
  acts_as_gmappable
  def gmaps4rails_address
    ""
  end

  def gmaps4rails_infowindow
    head = "<a href=\"#{billboard_path(self)}\"><h3>#{self.name}</h3></a>"
  end
end
