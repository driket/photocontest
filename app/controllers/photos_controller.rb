#!/bin/env ruby
# encoding: utf-8
class PhotosController < ApplicationController
  
  before_filter CASClient::Frameworks::Rails::Filter
  
  def user_is_owner?(photo)
    @photo.user_uid == session[:cas_user]    
  end
   
  # GET /photos
  # GET /photos.json
  def index
    #@photos = Photo.all

    #respond_to do |format|
    #  format.html # index.html.erb
    #  format.json { render json: @photos }
    #end
  end

  # GET /photos/1
  # GET /photos/1.json
  def show
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if @photo.user_uid != session[:cas_user]
        format.html { redirect_to @photo.contest, alert: 'Vous ne pouvez pas afficher cette photo.' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      else
        format.html # show.html.erb
        format.json { render json: @photo }
      end
    end
  end

  # GET /photos/new
  # GET /photos/new.json
  def new
    @photo = Photo.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @photo }
    end
  end

  # GET /photos/1/edit
  def edit
    @photo = Photo.find(params[:id])
    if !user_is_owner?(@photo)
      redirect_to @photo.contest, alert: 'Vous ne pouvez pas afficher cette photo.'
    end
  end

  # POST /photos
  # POST /photos.json
  def create
    @photo = Photo.new(params[:photo])
    @photo.user_uid = session[:cas_user]
    user_photos = @photo.contest.photos.where(:user_uid => session[:cas_user])
    contest = @photo.contest
    respond_to do |format|
      if @photo.contest.status != "open"
        format.html { redirect_to @photo.contest, alert: 'Ce concours n\'est pas ouvert aux participations.' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      elsif user_photos.size >= contest.max_photos_per_user
        format.html { redirect_to @photo.contest, alert: 'Vous avez dépassé le nombre maximum de photo pour ce concours. Vous pouvez en supprimer.' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      elsif @photo.save
        format.html { redirect_to @photo.contest, notice: 'Merci pour votre participation ! Votre photo vient d\'être ajoutée.' }
        format.json { render json: @photo, status: :created, location: @photo }
      else
        format.html { render action: "new" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /photos/1
  # PUT /photos/1.json
  def update
    @photo = Photo.find(params[:id])
    respond_to do |format|
      if !user_is_owner?(@photo)
        format.html { redirect_to @photo.contest, alert: 'Vous ne pouvez pas modifier cette photo.' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      elsif @photo.update_attributes(params[:photo])
        format.html { redirect_to @photo.contest, notice: 'Votre photo a été mise à jour.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /photos/1
  # DELETE /photos/1.json
  def destroy
    @photo = Photo.find(params[:id])

    respond_to do |format|
      if !user_is_owner?(@photo)
        format.html { redirect_to @photo.contest, alert: 'Vous ne pouvez pas supprimer cette photo.' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      else
        @photo.destroy
        format.html { redirect_to :back, notice: 'Votre photo a bien été supprimée.'}
        format.json { head :no_content }
      end
    end
  end
  
  def vote
    @photo = Photo.find(params[:id])
    #@current_user = User.find(session[:cas_user])
    logger.debug "------> vote" 
    logger.debug @photo.inspect 
    #logger.debug @current_user.inspect 
    # 
    respond_to do |format|
      if 1==2
        format.html { redirect_to @photo.contest, alert: 'Vous ne pouvez pas supprimer cette photo.' }
        format.json { render json: @photo.errors, status: :unprocessable_entity }
      else
        format.html { redirect_to :back, notice: 'Votre voix a bien été pris en compte.'}
        format.json { render json: @photo }
      end
    end
  end
  
  def unvote
    
  end
end
