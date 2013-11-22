#!/bin/env ruby
# encoding: utf-8
class Photo < ActiveRecord::Base
  attr_accessible :body, :title, :description, :contest_id
  
  belongs_to :contest
  has_many :votes
  
  attr_accessible :image
  has_attached_file :image, 
    :styles => { :medium => "300x300", :thumb => "100x100" }, 
    :default_url => "/assets/missing.png",
    :url => "/system/:hash.:extension",
    :hash_secret => "longSecretString"

  #validates_presence_of :title
  validates :image, :attachment_presence => true
  validate :image_landscape_orientation
  validate :image_min_width
  validate :image_min_height
  
  scope :top12_for_contest, lambda {|contest_id|
    select("photos.*, count(votes.id) AS votes_count").
    where(:contest_id => contest_id).
    joins(:votes).
    group("photos.id").
    order("votes_count DESC").
    limit(12)
  }  
  def is_voted_by_user?(user_id)
    (Vote.where(:user_uid => user_id, :photo_id => id).size > 0)
  end
  
  def check_if_double_vote
    voters = []
    double_voters = []
    for vote in votes
      if voters.include?vote.user_uid
        double_voters << vote.user_uid
      end
      voters << vote.user_uid
    end
    double_voters
  end
  
  def vote!(user_uid)
    if contest.status != "vote_open"
      return 'Vous ne pouvez pas voter pour cette photo. (les votes ne sont pas ouverts pour ce concours)'
    elsif is_voted_by_user?(user_uid)
      return 'Vous ne pouvez pas voter pour cette photo. (vous l\'avez déjà fait)'
      #elsif Vote.where(:user_uid => user_uid).size >= contest.max_vote_per_user
    elsif contest.remaining_votes_for_user(user_uid) <= 0
      return 'Vous ne pouvez pas voter pour cette photo. (vous atteint la limite de voix pour ce concours)'
    end
    vote = Vote.new(:user_uid => user_uid, :photo_id => id)
    vote.save!
    return ''
  end
  
  def unvote!(user_uid)
    vote = Vote.where(:user_uid => user_uid, :photo_id => id)
    if vote.size == 0
      return 'Vous ne pouvez pas retirer votre voix pour cette photo. (vous n\'aviez pas voté)'
    end
    vote.first.delete
    return ''
  end
  
  protected
  
    def image_landscape_orientation
      dimensions = Paperclip::Geometry.from_file(image.queued_for_write[:original].path)
      if dimensions.width < dimensions.height
        errors[:photo] << 'doit être au format paysage (largeur > hauteur).'
      end
    end 
    
    def image_min_width
      min_width = 1200
      dimensions = Paperclip::Geometry.from_file(image.queued_for_write[:original].path)
      if dimensions.width < min_width
        errors[:photo] << "doit avoir une largeur supérieure à #{min_width} pixels."
      end
    end 
    
    def image_min_height
      min_height = 800
      dimensions = Paperclip::Geometry.from_file(image.queued_for_write[:original].path)
      if dimensions.height < min_height
        errors[:photo] << "doit avoir une hauteur supérieure à #{min_height} pixels."
      end
    end 
end
