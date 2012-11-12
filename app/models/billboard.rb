class Billboard < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  attr_accessible :description, :gmaps, :latitude, :longitude, :name, :user, :key
  has_many :announcements
  belongs_to :user
	# where do we specify the database field's length? does rails infer the length from the validator?
	validates :name, :length => {:minimum => 3, :maximum => 30}
	validates_numericality_of :latitude, {:minimum => -90, :maximum => 90}
	validates_numericality_of :longitude, {:minimum => -180, :maximum => 180}
  
  acts_as_gmappable
  def gmaps4rails_address
    ""
  end

  def gmaps4rails_infowindow
    head = "<a href=\"#{billboard_path(self)}\"><h3>#{self.name}</h3></a>"
  end
end
