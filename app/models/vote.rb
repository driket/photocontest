class Vote < ActiveRecord::Base
  belongs_to :photo
  attr_accessible :user_uid
end
