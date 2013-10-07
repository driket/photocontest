class Contest < ActiveRecord::Base
  attr_accessible :body, :description, :action_title, :date_end, :date_start, :max_photos_per_user, :max_vote_per_user, :title, :vote_end, :vote_start
end
