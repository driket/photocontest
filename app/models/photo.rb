class Photo < ActiveRecord::Base
  attr_accessible :body, :title, :description, :user_uid, :contest_id
  
  belongs_to :contest
  
  attr_accessible :image
  has_attached_file :image, :styles => { :medium => "300x300#", :thumb => "100x100#" }, :default_url => "/assets/missing.png"

  validates :image, :attachment_presence => true
  
end
