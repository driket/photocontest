class Photo < ActiveRecord::Base
  attr_accessible :body, :title, :description, :user_uid, :contest_id
  
  belongs_to :contest
end
