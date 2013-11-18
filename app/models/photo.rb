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
