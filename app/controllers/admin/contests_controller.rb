class Admin::ContestsController < ApplicationController
  
  # GET /contests
  # GET /contests.json
  def index
    @contests = Contest.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contests }
    end
  end
  
end
