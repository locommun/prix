class Announcement < ActiveRecord::Base
  
  attr_accessible :description, :name, :billboard_id, :user, :gmaps, :latitude, :longitude, :uj, :bt, :billboard
  
  belongs_to :billboard
  belongs_to :user
  has_many :comments
  
  #Announcement Templates
  
  has_many :userjoins
  has_many :bringthings
  
  validates :name, :length => {:minimum => 3, :maximum => 30}
  validates :description, :length => {:minimum => 20}

  
  acts_as_gmappable
    
  def gmaps4rails_address
      ""
    end

  reverse_geocoded_by :latitude, :longitude


  
  
  validates_length_of :description, :minimum => 50
  validates_length_of :name, :maximum => 30

  def joined? user
    !(user.userjoins.where(:announcement_id => self.id).empty?)
  end
  
end
