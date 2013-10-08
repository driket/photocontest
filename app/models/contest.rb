class Contest < ActiveRecord::Base
  attr_accessible :body, :description, :action_title, :date_end, :date_start, :max_photos_per_user, :max_vote_per_user, :title, :vote_end, :vote_start
  
  has_many :photos
  
  scope :open, lambda { where("date_start <= ? AND date_end >= ?", DateTime.now, DateTime.now) }
  scope :closed, lambda { where("date_end <= ?", DateTime.now) }
  
  def status
    if DateTime.now.to_i > date_end.to_i
      return "finished"
    elsif DateTime.now.to_i > date_start.to_i and DateTime.now.to_i < date_end.to_i
      return "open"
    elsif DateTime.now.to_i < date_start.to_i
      return "waiting"
    end
  end
  
  def vote_status
    if DateTime.now.to_i > vote_end.to_i
      return "finished"
    elsif DateTime.now.to_i > vote_start.to_i and DateTime.now.to_i < vote_end.to_i
      return "open"
    elsif DateTime.now.to_i < vote_start.to_i
      return "waiting"
    end
  end
end
