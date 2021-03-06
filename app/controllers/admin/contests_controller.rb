#!/bin/env ruby
# encoding: utf-8
class Admin::ContestsController < ApplicationController
  
  before_filter CASClient::Frameworks::Rails::Filter
  before_filter :ensure_is_admin
  
  # GET /contests
  # GET /contests.json
  def index
    @contests = Contest.order(:created_at).reverse_order
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contests }
    end
  end
  
  # GET /contests/new
  # GET /contests/new.json
  def new
    @contest = Contest.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @contest }
    end
  end

  # GET /contests/1/edit
  def edit
    @contest = Contest.find(params[:id])
    @photos = @contest.photos
  end

  # POST /contests
  # POST /contests.json
  def create
    @contest = Contest.new(params[:contest])

    respond_to do |format|
      if @contest.save
        format.html { redirect_to edit_admin_contest_path(@contest), notice: 'Le concours a été créé.' }
        format.json { render json: @contest, status: :created, location: @contest }
      else
        format.html { render action: "new" }
        format.json { render json: @contest.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /contests/1
  # PUT /contests/1.json
  def update
    @contest = Contest.find(params[:id])

    respond_to do |format|
      if @contest.update_attributes(params[:contest])
        format.html { redirect_to edit_admin_contest_path(@contest), notice: 'Le concours a été mis à jour.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @contest.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contests/1
  # DELETE /contests/1.json
  def destroy
    @contest = Contest.find(params[:id])
    @contest.destroy

    respond_to do |format|
      format.html { redirect_to admin_contests_url }
      format.json { head :no_content }
    end
  end
  
end
