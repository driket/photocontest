class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :connected_user, :is_admin?, :check_if_admin
  
  def connected_user
	  LdapUser.find(session[:cas_user])
  end
  
  def is_admin?
    if !session[:cas_user]
      return false
    elsif !Settings.admin_list.include? session[:cas_user]
      return false
    else
      return true
    end
  end
  
  def check_if_admin
    if !is_admin?
      redirect_to :back, alert: 'Vous navez pas les privilièges suffisants pour effectuer cette action.'
    end
  end
end
