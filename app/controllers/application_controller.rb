class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :connected_user
  
  def connected_user
	  LdapUser.find(session[:cas_user])
  end
  
end
