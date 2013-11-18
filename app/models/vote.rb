class Vote < ActiveRecord::Base
  attr_accessible :photo_id, :user_uid
  belongs_to :photo
  attr_accessible :user_uid
end
