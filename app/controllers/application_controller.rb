class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :connected_user, :is_admin?, :is_connected?, :ensure_is_admin
  
  def connected_user
	  LdapUser.find(session[:cas_user])
  end
  
  def is_admin?
    CASClient::Frameworks::Rails::Filter
    if !session[:cas_user]
      return false
    elsif !Settings.admin_list.include? session[:cas_user]
      return false
    else
      return true
    end
  end
  
  def is_connected?
    CASClient::Frameworks::Rails::Filter
    if !session[:cas_user]
      return false
    else
      return true
    end
  end
  
  def ensure_is_connected
    if !is_connected?
      redirect_to '/', alert: 'Vous devez vous connecter pour effectuer cette action.'
    end
  end
    
  def ensure_is_admin
    if !is_admin?
      redirect_to '/', alert: 'Vous navez pas les privilièges suffisants pour effectuer cette action.'
    end
  end
  
end
