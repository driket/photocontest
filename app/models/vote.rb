class Vote < ActiveRecord::Base
  attr_accessible :photo_id, :user_uid
  belongs_to :photo
  attr_accessible :user_uid
  
  scope :votes_for_user, lambda {|contest_id, user_uid|
    select("votes.*, photos.contest_id").
    joins(:photo).
    where("photos.contest_id" => contest_id, 'votes.user_uid' => user_uid)
  }  
  
end
