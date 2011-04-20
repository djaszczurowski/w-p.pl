# encoding: utf-8
class ApplicationController < ActionController::Base
  protect_from_forgery
  
  layout "application"
  helper_method :admin_panel
  helper_method :current_user
  helper_method :is_admin_logged
  helper_method :is_english_language
  helper_method :change_language
  helper_method :layout_sort
	
  def layout_sort
  	if(is_admin_logged)
  		"admin_panel"
  	else
  		"application"
  	end
  end	
	
  def is_admin_logged
  	if session[:current_user_id]
  		user = User.find(session[:current_user_id])
  		return	user && user.privilegesLevel > 0
  	else
  		false
  	end
  end

  def change_language
    if is_english_language
      cookies[:lang] = "pl"
    else
      cookies[:lang] = "en"
    end
    redirect_to root_url
  end
  
  def admin_panel  	
  	return @admin_panel
  end
  
  def is_english_language
  	return cookies[:lang] == "en"
  end
  
  def current_user  	  
  	@current_user ||= session[:current_user_id] if session[:current_user_id]  		
  	return @current_user
  end
 
  
end
