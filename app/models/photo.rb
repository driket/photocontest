class Photo < ActiveRecord::Base
  attr_accessible :body, :title, :description, :contest_id
  
  belongs_to :contest
  
  attr_accessible :image
  has_attached_file :image, 
    :styles => { :medium => "300x300#", :thumb => "100x100#" }, 
    :default_url => "/assets/missing.png",
    :url => "/system/:hash.:extension",
    :hash_secret => "longSecretString"

  validates :image, :attachment_presence => true
  validates_presence_of :title
  
end
