class Billboard < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  attr_accessible :description, :gmaps, :latitude, :longitude, :name, :user, :key, :user_id, :created_at, :updated_at
  has_many :announcements
  belongs_to :user
  has_many :dialogs
  has_many :billboard_activations
  
  
	# where do we specify the database field's length? does rails infer the length from the validator?
	validates :name, :length => {:minimum => 3, :maximum => 30}
	validates_numericality_of :latitude, {:minimum => 0, :maximum => 90}
	validates_numericality_of :longitude, {:minimum => -180, :maximum => 180}
  
  acts_as_gmappable :process_geocoding => false
  def gmaps4rails_address
    ""
  end

  reverse_geocoded_by :latitude, :longitude

  def gmaps4rails_infowindow
    if self.id
      head = "<a href=\"#{billboard_path(self)}\"><h3>#{self.name}</h3></a>"
    else
      ""
    end
  end
  
  def is_activated? user
    self.user == user ||  BillboardActivation.exists?(:user_id => user.id, :billboard_id => self.id)
  end
  

  
end
