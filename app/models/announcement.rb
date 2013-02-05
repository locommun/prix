class Announcement < ActiveRecord::Base
  include Rails.application.routes.url_helpers
  attr_accessor :datetime_type
  attr_accessible :description, :name, :billboard_id, :user, :gmaps, :latitude, :longitude, :uj, :bt, :billboard, :datetime_type, :location
  
  belongs_to :billboard
  belongs_to :user
  has_many :comments
  
  #Announcement Templates
  
  has_many :userjoins
  has_many :bringthings
  has_many :date_time_suggestions
  validates :name, :length => {:minimum => 3, :maximum => 30}
  validates :description, :length => {:minimum => 20}

  
  acts_as_gmappable
    
  def gmaps4rails_address
      ""
  end
  
  def gmaps4rails_infowindow
    if self.id
      head = "<a href=\"#{url_for(announcement_path(self,:locale => I18n.locale))}\"><h3>#{self.name}</h3></a>"
    else
      ""
    end
  end

  reverse_geocoded_by :latitude, :longitude


  
  
  validates_length_of :description, :minimum => 50
  validates_length_of :name, :maximum => 30

  def joined? user
    !(user.userjoins.where(:announcement_id => self.id).empty?)
  end
  
  
end
