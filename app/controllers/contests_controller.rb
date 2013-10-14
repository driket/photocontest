class ContestsController < ApplicationController
  
  before_filter CASClient::Frameworks::Rails::Filter, :except => :index
  
  def login
    redirect_to contests_url, notice: 'Vous êtes maintenant authentifié'
  end
  
  def logout
    CASClient::Frameworks::Rails::Filter.logout(self)  
  end
  
  # GET /contests
  # GET /contests.json
  def index
    @open_contests = Contest.open.order(:date_start).reverse_order
    @closed_contests = Contest.closed.order(:date_start).reverse_order
    @on_vote_contests = Contest.on_vote.order(:date_start).reverse_order
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @contests }
    end
  end

  # GET /contests/1
  # GET /contests/1.json
  def show
    @contest = Contest.find(params[:id])
    @my_photos = @contest.photos.where(:user_uid => session[:cas_user])
    @photo = Photo.new(:contest_id => @contest.id)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @contest }
    end
  end

end
