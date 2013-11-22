class Contest < ActiveRecord::Base
  attr_accessible :body, :description, :action_title, :vote_action_title, :date_end, :date_start, :max_photos_per_user, :max_vote_per_user, :title, :vote_end, :vote_start
  
  has_many :photos
  
  scope :open, lambda { where("date_start <= ? AND date_end >= ?", DateTime.now, DateTime.now) }
  scope :closed, lambda { where("date_end <= ?", DateTime.now) }
  scope :on_vote, lambda { where("vote_start <= ? AND vote_end >= ?", DateTime.now, DateTime.now) }
  
  def status
    if DateTime.now.to_i > vote_end.to_i 
      return "vote_closed"
    elsif DateTime.now.to_i > vote_start.to_i and DateTime.now.to_i < vote_end.to_i
      return "vote_open"
    elsif DateTime.now.to_i > date_end.to_i and DateTime.now.to_i < vote_start.to_i
      return "finished"
    elsif DateTime.now.to_i > date_start.to_i and DateTime.now.to_i < date_end.to_i
      return "open"
    elsif DateTime.now.to_i < date_start.to_i
      return "waiting"
    end
  end
  
  def remaining_votes_for_user(user_uid)
    max_votes = max_vote_per_user || 0
    user_votes = Vote.votes_for_user(id, user_uid).size
    return max_votes - user_votes
  end
  
  def votes
    photos.joins(:votes)
    #Vote.votes_for_user(id, "villa")
  end
  
end
